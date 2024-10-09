import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled8/Repository/Api/Profile/Profile.dart';
import 'package:untitled8/Repository/Model_class/Profile_Model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileModel profileModel;
  ProfileApi profileApi = ProfileApi();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async{
      emit(Profileloading());
      try{
        profileModel=await profileApi.getProfile(event.name);
        emit(Profileloaded());
      }
      catch (e){
        emit(
          Profileerror(),
        );
        print(e.toString());
      }
      // TODO: implement event handler
    });
  }
}
