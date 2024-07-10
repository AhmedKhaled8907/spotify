part of 'profile_info_cubit.dart';

@immutable
sealed class ProfileInfoState {}

final class ProfileInfoInitial extends ProfileInfoState {}

final class ProfileInfoLoading extends ProfileInfoState {}

final class ProfileInfoLoaded extends ProfileInfoState {
  final UserModel user;
  ProfileInfoLoaded({required this.user});
}

final class ProfileInfoFailure extends ProfileInfoState {
  final String message;
  ProfileInfoFailure({required this.message});
}
