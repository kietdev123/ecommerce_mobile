import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent {}

class AuthenticationSignInWithEmailPassWordEvent extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticationSignInWithEmailPassWordEvent(this.email, this.password);
}

class SignUpEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  SignUpEvent(this.name, this.email, this.password);
}

class ForgotPasswordEvent extends AuthenticationEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

class SignOutEvent extends AuthenticationEvent {}

class LoadProfileEvent extends AuthenticationEvent {}
