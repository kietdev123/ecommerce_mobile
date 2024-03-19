import 'package:ecommerce_mobile/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<dynamic> signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  User? loadProfile() {
    try {
      return auth.currentUser;
    } catch (e) {
      rethrow;
    }
  }
}
