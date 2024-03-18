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

  AuthenticationBloc() : super(AuthenticationInitial(0)) {
    auth = FirebaseAuth.instanceFor(app: app);
    // on<AuthenticationSignInWithEmailPassWordEvent>((event, emit) {
    //   _signIn(event, emit);
    // });
    on<AuthenticationSignInWithEmailPassWordEvent>(_signIn);
  }

  Future<void> _signIn(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    if (event is AuthenticationSignInWithEmailPassWordEvent) {
      try {
        await _authenticationRepo.signInWithEmailPassword(
            event.email, event.password);

        emit(AuthenticationSignInSuccess());
      } on FirebaseAuthException catch (e) {
        print(e);

        emit(AuthenticationPageError(e.message));
      }
    }
  }
}