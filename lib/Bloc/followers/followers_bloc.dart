import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Profile/Profile.dart';
import '../../Repository/Model_class/Followers_Model.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  late FollowersModel followersModel;
  ProfileApi profileApi = ProfileApi();
  FollowersBloc() : super(FollowersInitial()) {
    on<FetchFollowers>((event, emit)async {
      emit(
          followersLoading()
      );
      try{
        followersModel=await profileApi.getFollowers(event.name);
        emit(followersLoaded());
      }
      catch (e){
        emit(
          followesError(),
        );
        print(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
