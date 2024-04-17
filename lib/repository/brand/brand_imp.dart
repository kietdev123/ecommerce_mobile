
import '../../data/models/brand.dart';
import '../../data/remote/firebase/firebase_service.dart';
import 'brand_repo.dart';

class BrandRepoImp extends BrandRepo {
  final FirebaseService _fireBaseService = FirebaseService();

  @override
  Future<BrandModel?> getBrand() async {
    try {
      return await _fireBaseService.getBrand();
    } catch (e) {
      rethrow;
    }
  }
}
