import 'package:ecommerce_mobile/data/models/product_type.dart';
import 'package:ecommerce_mobile/data/remote/firebase/firebase_service.dart';
import 'product_type_repo.dart';

class ProductTypeRepoImp extends ProductTypeRepo {
  final FirebaseService _fireBaseService = FirebaseService();

  @override
  Future<ProductTypeModel?> getProductType() async {
    try {
      return await _fireBaseService.getProductType();
    } catch (e) {
      rethrow;
    }
  }
}
