import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repository/Api/Profile/Profile.dart';
import '../../Repository/Model_class/Tagg_Model.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  late TaggModel taggModel;
  ProfileApi profileApi = ProfileApi();
  TagBloc() : super(TagInitial()) {
    on<Fetchtag>((event, emit) async{
      emit(
          tagLoading()
      );
      try{
        taggModel=await profileApi.getTagg(event.name);
        emit(tagLoaded());
      }
      catch (e){
        emit(
          tagError(),
        );
      }
      // TODO: implement event handler
    });
  }
}
