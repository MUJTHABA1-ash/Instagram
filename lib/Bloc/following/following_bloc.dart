import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Profile/Profile.dart';
import '../../Repository/Model_class/Following_Model.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  late FollowingModel followingModel;
  ProfileApi profileApi = ProfileApi();
  FollowingBloc() : super(FollowingInitial()) {
    on<FetchFollowing>((event, emit) async{
      emit(
          followingLoading()
      );
      try{
        followingModel=await profileApi.getFollowing(event.name);
        emit(followingLoaded());
      }
      catch (e){
        emit(
          followingError(),
        );
        print(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
