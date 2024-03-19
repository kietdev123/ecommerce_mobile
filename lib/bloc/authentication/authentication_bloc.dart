import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../main.dart';
import '../../repository/authentication/authentication_imp.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  //Authentication repo instance
  final _authenticationRepo = AuthenticationRepoImp();
  int value = 0;
  late final FirebaseAuth auth;
  User? user;
  AuthenticationBloc() : super(AuthenticationInitial(0)) {
    on<AuthenticationSignInWithEmailPassWordEvent>(_signIn);
    on<SignOutEvent>(_logout);
    on<LoadProfileEvent>(_loadProfile);
  }

  Future<void> _signIn(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    if (event is AuthenticationSignInWithEmailPassWordEvent) {
      try {
        UserCredential userCredential = await _authenticationRepo
            .signInWithEmailPassword(event.email, event.password);
        user = userCredential.user;

        _checkProfile(emit);
      } on FirebaseAuthException catch (e) {
        print(e);

        emit(AuthenticationError(e.message));
      }
    }
  }

  Future<void> _logout(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    if (event is SignOutEvent) {
      try {
        await _authenticationRepo.signOut();

        emit(SignOutSuccess());
      } on FirebaseAuthException catch (e) {
        print(e);

        emit(AuthenticationError(e.message));
      }
    }
  }

  Future<void> _loadProfile(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    if (event is LoadProfileEvent) {
      user = _authenticationRepo.loadProfile();
      // user = event.user;
      _checkProfile(emit);
    }
  }

  void _checkProfile(emit) {
    if (user != null) {
      for (final providerProfile in user!.providerData) {
        // ID of the provider (google.com, apple.com, etc.)
        final provider = providerProfile.providerId;

        // UID specific to the provider
        final uid = providerProfile.uid;

        // Name, email address, and profile photo URL
        final name = providerProfile.displayName;
        final emailAddress = providerProfile.email;
        final profilePhoto = providerProfile.photoURL;
        emit(AuthenticationSuccess(
            uid: uid,
            name: name,
            emailAddress: emailAddress,
            profilePhoto: profilePhoto));
      }
    }
  }
}
