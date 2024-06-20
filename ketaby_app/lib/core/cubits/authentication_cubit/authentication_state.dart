part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class IsThereIsUserLoadingState extends AuthenticationState {}
class IsThereIsUserSuccessState extends AuthenticationState {}
class IsThereIsUserErrorState extends AuthenticationState {}


class ChangePasswordVisabilityState extends AuthenticationState {}
class LoadingRegisterState extends AuthenticationState {}
class SuccessRegisterState extends AuthenticationState {}
class ErrorRegisterState extends AuthenticationState {}
class LoadingLoginState extends AuthenticationState {}
class SuccessLoginState extends AuthenticationState {}
class ErrorLoginState extends AuthenticationState {}
class SuccessSaveTokenState extends AuthenticationState {}
class LoadingDeleteTokenState extends AuthenticationState {}
class SuccessDeleteTokenState extends AuthenticationState {}
class ErrorDeleteTokentState extends AuthenticationState {}

class ResetVariablesState extends AuthenticationState {}
