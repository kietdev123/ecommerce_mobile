abstract class AuthenticationEvent {}

class AuthenticationSignInWithEmailPassWordEvent extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticationSignInWithEmailPassWordEvent(this.email, this.password);
}
