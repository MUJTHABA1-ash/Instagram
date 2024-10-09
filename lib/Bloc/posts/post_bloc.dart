import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Profile/Profile.dart';
import '../../Repository/Model_class/Post_Model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late PostModel postModel;
  ProfileApi profileApi = ProfileApi();
  PostBloc() : super(PostInitial()) {
    on<Fetchpost>((event, emit)async {
      emit(
          postLoading()
      );
      try{
        postModel=await profileApi.getPost(event.name);
        emit(postLoaded());
      }
      catch (e){
        emit(
          postError(),
        );
        print(e.toString());
      }
      // TODO: implement event handler
    });
      // TODO: implement event handler
    }
  }

