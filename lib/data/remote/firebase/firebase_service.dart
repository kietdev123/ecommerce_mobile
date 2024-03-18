import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<dynamic> signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch (e) {
      rethrow;
    }
  }
}
