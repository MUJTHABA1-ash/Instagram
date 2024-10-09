import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/Bloc/following/following_bloc.dart';
import 'package:untitled8/Repository/Model_class/Following_Model.dart';
import 'package:untitled8/Ui/Followers_profile.dart';


import '../Bloc/followers/followers_bloc.dart';
import '../Repository/Model_class/Followers_Model.dart';

class Followers extends StatefulWidget {
  final String name;
  final String Followerscount;
  final String Followingcount;

  const Followers({
    super.key,
    required this.name,
    required this.Followerscount,
    required this.Followingcount,
  });

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  late FollowersModel followers;
  late FollowingModel following;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FollowersBloc>(context).add(FetchFollowers(name: widget.name));
    BlocProvider.of<FollowingBloc>(context).add(FetchFollowing(name: widget.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 20.sp,
                color: Colors.white,
              )),
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: DefaultTabController(
            length: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text('${widget.Followerscount} followers'),
                  ),
                  Tab(
                    child: Text('${widget.Followingcount} following'),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.black,
                      child: BlocBuilder<FollowersBloc, FollowersState>(
                        builder: (context, state) {
                          if (state is followersLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is followesError) {
                            return Text("swaliheeeeee");
                          }
                          if (state is followersLoaded) {
                            followers = BlocProvider.of<FollowersBloc>(context)
                                .followersModel;
                            return ListView.separated(
                              itemCount: followers.data!.items!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FollowersProfile(name: followers.data!.items![index].username
                                          .toString(),)));
                                    },
                                    child: CircleAvatar(
                                      radius: 25.r,
                                      backgroundImage: NetworkImage(followers
                                          .data!.items![index].profilePicUrl
                                          .toString()),
                                    ),
                                  ),
                                  title: Text(
                                    followers.data!.items![index].fullName
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                  subtitle: Text(
                                    followers.data!.items![index].username
                                        .toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  trailing: Container(
                                    height: 25.h,
                                    width: 95.w,
                                    decoration: ShapeDecoration(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5.r))),
                                    child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 10.sp),
                                        )),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10.h);
                              },
                            );
                          }
                          else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      child: BlocBuilder<FollowingBloc, FollowingState>(
                        builder: (context, state) {
                          if (state is followingLoading) {
                            return Center(
                                child: CircularProgressIndicator());
                          }
                          if (state is followingError) {
                            return RefreshIndicator(
                                child: Text("Something went Wrong"),
                                onRefresh:()async{
                                  BlocProvider.of<FollowingBloc>(
                                      context)
                                      .add(FetchFollowing(name: null));});
                          }
                          if(state is followingLoaded){
                           following = BlocProvider.of<FollowingBloc>(context).followingModel;
                            return ListView.separated(
                              itemCount: following.data!.items!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage: NetworkImage(
                                      following.data!.items![index].profilePicUrl.toString()
                                    ),
                                  ),
                                  title: Text(
                                    following.data!.items![index].fullName.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.sp),
                                  ),
                                  subtitle: Text(
                                    following.data!.items![index].username.toString(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  trailing: Container(
                                    height: 25.h,
                                    width: 95.w,
                                    decoration: ShapeDecoration(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5.r))),
                                    child: Center(
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 10.sp),
                                        )),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10.h);
                              },
                            );
                          }
                         else{
                           return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
