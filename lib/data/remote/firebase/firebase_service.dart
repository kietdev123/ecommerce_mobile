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

  Future<dynamic> signUpWithEmailPassword(
      String name, String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user?.updateDisplayName(name);
      await credential.user
          ?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      return credential;
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
