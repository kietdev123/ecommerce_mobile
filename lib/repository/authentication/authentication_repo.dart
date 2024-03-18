abstract class AuthenticationRepo {
  Future<dynamic> signInWithEmailPassword(
      String email, String password) async {}
}
