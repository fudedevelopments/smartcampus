import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartcampus/bloc/repo/userprofilerepo.dart';
import 'package:smartcampus/models/StudentsUserProfile.dart';

part 'userprofile_event.dart';
part 'userprofile_state.dart';

class UserprofileBloc extends Bloc<UserprofileEvent, UserprofileState> {
  UserprofileBloc() : super(UserprofileInitial()) {
    on<GetUserProfileEvent>(getUserProfileEvent);
  }

  Future<void> getUserProfileEvent(
      GetUserProfileEvent event, Emitter<UserprofileState> emit) async {
    emit(UserProfileLoadingState());
    try {
      final userProfile = await UserProfileRepo().getUserProfile(userId: event.userid);

      if (userProfile == null) {
        emit(UserProfileEmptyState());
      } else {
        emit(UserProfileSucessState(userProfile: userProfile));
      }
    } catch (e) {
      emit(UserProfileFailedState(error: e.toString()));
    }
  }
   
    
  }

