abstract class AuthenticationRepo {
  Future<dynamic> signInWithEmailPassword(
      String email, String password) async {}
  Future<void> signOut() async {}
  void loadProfile() {}
}
