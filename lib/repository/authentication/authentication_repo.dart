abstract class AuthenticationRepo {
  Future<dynamic> signInWithEmailPassword(
      String email, String password) async {}
  Future<void> signOut() async {}
  void loadProfile() {}
  Future<dynamic> signUp(String name, String email, String password) async {}
  Future<void> forgotPassword(String email) async {}
}
