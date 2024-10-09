import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled8/Bloc/highlites/highlite_bloc.dart';
import 'package:untitled8/Repository/Model_class/Highlite_Model.dart';
import 'package:untitled8/Repository/Model_class/Post_Model.dart';
import 'package:untitled8/Repository/Model_class/Profile_Model.dart';
import 'package:untitled8/Repository/Model_class/Tagg_Model.dart';
import 'package:untitled8/Ui/Followers.dart';

import '../Bloc/posts/post_bloc.dart';
import '../Bloc/profiles/profile_bloc.dart';
import '../Bloc/tags/tag_bloc.dart';

class FollowersProfile extends StatefulWidget {
  final String name;


  const FollowersProfile({super.key, required this.name, });

  @override
  State<FollowersProfile> createState() => _ProfileState();
}

class _ProfileState extends State<FollowersProfile> {
  late ProfileModel profile;
  late HighliteModel highlite;
  late PostModel post;
  late TaggModel tag;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfileBloc>(context).add(FetchProfile(name: widget.name));
    BlocProvider.of<HighliteBloc>(context).add(
        FetchHighlite(name: widget.name));
    BlocProvider.of<PostBloc>(context).add(Fetchpost(name: widget.name));
    BlocProvider.of<TagBloc>(context).add(Fetchtag(name: widget.name));
  }

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:  SafeArea(
          child: DefaultTabController(
            length: 2,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is Profileloading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is Profileerror) {
                  return RefreshIndicator(
                      child: Center(
                          child: Text(
                            "Something went wrong",
                            style: TextStyle(color: Colors.white),
                          )),
                      onRefresh: () async {
                        BlocProvider.of<ProfileBloc>(context).add(FetchProfile(name: null));
                      });
                }
                if (state is Profileloaded) {
                  profile = BlocProvider.of<ProfileBloc>(context).profileModel;
                  String followers = k_m_b_generator(
                      double.parse(profile.data!.followerCount.toString()));
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: 20.w),
                        child: Row(
                          children: [
                            GestureDetector( onTap: (){Navigator.of(context).pop();}
                                ,child: Icon(Icons.arrow_back,size: 25.sp,color: Colors.white,)),
                            Spacer(

                            ),
                            Text(
                                profile.data!.fullName.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              color: Colors.white
                            ),),
                            Spacer(

                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: 20.w),
                              child: Icon(BootstrapIcons.three_dots_vertical,color: Colors.white,size: 25.sp,),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 33.r,
                              backgroundImage: NetworkImage(
                                profile.data!.profilePicUrlHd.toString(),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  profile.data!.mediaCount.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Posts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   
                                  },
                                  child: Text(
                                    followers,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Followers',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => Followers(
                                          name: profile.data!.username
                                              .toString(),
                                          Followerscount: followers,
                                          Followingcount: profile
                                              .data!.followingCount
                                              .toString(),
                                        )));
                                  },
                                  child: Text(
                                    profile.data!.followingCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Following',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.data!.fullName.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              profile.data!.biography.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'www.website.com',
                              style: TextStyle(
                                color: Color(0xFFD4E0ED),
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 28.h,
                              decoration: ShapeDecoration(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.r))),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 100.w,
                              height: 28.h,
                              decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.5.w, color: Color(0xFF343434)),
                                      borderRadius: BorderRadius.circular(7.r))),
                              child: Center(
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 100.w,
                              height: 28.h,
                              decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.5.w, color: Color(0xFF343434)),
                                      borderRadius: BorderRadius.circular(7.r))),
                              child: Center(
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 20.h,
                              color: Colors.black,
                              child: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 25.sp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 83.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: BlocBuilder<HighliteBloc, HighliteState>(
                            builder: (context, state) {
                              if (state is Highliteloading) {
                                return Center(child: CircularProgressIndicator());
                              }
                              if (state is Highliteerror) {
                                return Center(
                                  child: RefreshIndicator(
                                      child: Text("Error",style: TextStyle(color: Colors.white),),
                                      onRefresh: () async {
                                        BlocProvider.of<HighliteBloc>(context)
                                            .add(FetchHighlite(name: null));
                                      }),
                                );
                              }
                              if (state is Highliteloaded) {
                                highlite = BlocProvider.of<HighliteBloc>(context)
                                    .highliteModel;
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: highlite.data!.items!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30.r,
                                          backgroundImage: NetworkImage(
                                            highlite
                                                .data!
                                                .items![index]
                                                .coverMedia!
                                                .croppedImageVersion!
                                                .url
                                                .toString(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          highlite.data!.items![index].title
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFFAFAFA),
                                            fontSize: 10.sp,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(width: 15.w);
                                  },
                                );
                              } else {
                                return SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                      TabBar(
                          indicatorColor: Colors.white,
                          dividerColor: Colors.white10,
                          dividerHeight: 2,
                          tabs: [
                            Tab(
                              icon: Icon(
                                BootstrapIcons.grid_3x3,
                                size: 20.sp,
                                color: Colors.white,
                              ),
                            ),
                            Tab(
                              icon: Icon(
                                BootstrapIcons.person_square,
                                size: 20.sp,
                                color: Colors.white,
                              ),
                            )
                          ]),
                      Expanded(
                        child: TabBarView(children: [
                          Container(
                            color: Colors.black,
                            child: BlocBuilder<PostBloc, PostState>(
                              builder: (context, state) {
                                if (state is postLoading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is postError) {
                                  return Center(
                                    child: RefreshIndicator(
                                        child: Text("some thing went wrong",style: TextStyle(color: Colors.white),),
                                        onRefresh: () async {
                                          BlocProvider.of<PostBloc>(context)
                                              .add(Fetchpost(name: null));
                                        }),
                                  );
                                }
                                if (state is postLoaded) {
                                  post = BlocProvider.of<PostBloc>(context)
                                      .postModel;
                                  return GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 1.0,
                                    shrinkWrap: true,
                                    children: List.generate(
                                      post.data!.items!.length,
                                          (index) {
                                        return Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: ShapeDecoration(
                                              color: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5.r),
                                                ),
                                              ),
                                            ),
                                            child: Image.network(
                                              post.data!.items![index]
                                                  .thumbnailUrl
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                          Container(
                            color: Colors.black,
                            child: BlocBuilder<TagBloc, TagState>(
                              builder: (context, state) {
                                if (state is tagLoading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is tagError) {
                                  return RefreshIndicator(
                                      child: Text("something went wrong"),
                                      onRefresh: () async {
                                        BlocProvider.of<TagBloc>(context)
                                            .add(Fetchtag(name: null));
                                      });
                                }
                                if (state is tagLoaded) {
                                  tag =
                                      BlocProvider.of<TagBloc>(context).taggModel;
                                  return GridView.count(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 1.0,
                                    shrinkWrap: true,
                                    children: List.generate(
                                      tag.data!.items!.length,
                                          (index) {
                                        return Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5.r),
                                                ),
                                              ),
                                            ),
                                            child: Image.network(
                                              tag.data!.items![index].displayUrl
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          )
                        ]),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),);
  }
  }
