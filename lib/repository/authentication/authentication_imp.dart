import 'package:ecommerce_mobile/data/remote/firebase/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './authentication_repo.dart';

class AuthenticationRepoImp extends AuthenticationRepo {
  final FirebaseService _fireBaseService = FirebaseService();

  //. This method read data from server
  @override
  Future signInWithEmailPassword(String email, String password) async {
    try {
      dynamic response =
          await _fireBaseService.signInWithEmailPassword(email, password);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _fireBaseService.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  User? loadProfile() {
    try {
      return _fireBaseService.loadProfile();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signUp(String name, String email, String password) async {
    try {
      dynamic response =
          await _fireBaseService.signUpWithEmailPassword(name, email, password);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future forgotPassword(String email) async {
    try {
      await _fireBaseService.forgotPassword(email);
    } catch (e) {
      rethrow;
    }
  }
}
