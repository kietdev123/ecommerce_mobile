abstract class AuthenticationState {}

//This is innitial state of bloc
class AuthenticationInitial extends AuthenticationState {
  late final int value;
  AuthenticationInitial(this.value);
}

//This is the loading state of bloc
class AuthenticationLoading extends AuthenticationState {}

//This is the success state of bloc
class SignInSuccess extends AuthenticationState {}

class SignOutSuccess extends AuthenticationState {}

//This is the error state of bloc
class AuthenticationError extends AuthenticationState {
  late final dynamic error;
  AuthenticationError(this.error);
}
