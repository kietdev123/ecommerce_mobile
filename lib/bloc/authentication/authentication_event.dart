import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent {}

class AuthenticationSignInWithEmailPassWordEvent extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticationSignInWithEmailPassWordEvent(this.email, this.password);
}

class SignOutEvent extends AuthenticationEvent {}

class LoadProfileEvent extends AuthenticationEvent {}
