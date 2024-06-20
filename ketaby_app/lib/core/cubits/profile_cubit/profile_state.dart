part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class LoadingChangePasswordState extends ProfileState {}
class SuccessChangePasswordState extends ProfileState {}
class ErrorChangePasswordState extends ProfileState {}
class SuccessReadTokenState extends ProfileState {}
class ErrorReadTokenState extends ProfileState {}
class LoadingGetProfilDataState extends ProfileState {}
class SuccessGetProfileDataState extends ProfileState {}
class ErrorGetProfileDataState extends ProfileState {}
class SuccessResetControllersState extends ProfileState {}
class LoadingPickImageState extends ProfileState {}
class SuccessPickImageState extends ProfileState {}
class ErrorPickImageState extends ProfileState {}
class LoadingUpdateProfileDataState extends ProfileState {}
class SuccessUpdateProfileDataState extends ProfileState {}
class ErrorUpdateProfileDataState extends ProfileState {}