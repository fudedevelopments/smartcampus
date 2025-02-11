part of 'userprofile_bloc.dart';

@immutable
sealed class UserprofileEvent {}

class GetUserProfileEvent extends UserprofileEvent {
  final String email;
  final String userid;

  GetUserProfileEvent({required this.email, required this.userid});
}
