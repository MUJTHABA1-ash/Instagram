import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled8/Bloc/profiles/profile_bloc.dart';
import 'package:untitled8/Repository/Api/Profile/Profile.dart';
import 'package:untitled8/Repository/Model_class/Highlite_Model.dart';

part 'highlite_event.dart';

part 'highlite_state.dart';

class HighliteBloc extends Bloc<HighliteEvent, HighliteState> {
  late HighliteModel highliteModel;
  ProfileApi profileApi = ProfileApi();
  HighliteBloc() : super(HighliteInitial()) {
    on<FetchHighlite>((event, emit) async{
      emit(
          Highliteloading()
      );
      try{
        highliteModel=await profileApi.getHighlite(event.name);
        emit(Highliteloaded());
      }
      catch (e){
        emit(
          Highliteerror(),
        );
        print(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
