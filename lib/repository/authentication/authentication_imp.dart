import 'package:ecommerce_mobile/data/remote/firebase/firebase_service.dart';
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
}
