import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product.dart';
import '../../data/remote/firebase/firebase_service.dart';
import 'product_repo.dart';

class ProductRepoImp extends ProductRepo {
  final FirebaseService _fireBaseService = FirebaseService();

  @override
  Future<(List<ProductModel>, DocumentSnapshot?)> getProducts({
    int limit = 5,
    DocumentSnapshot<Object?>? startAfterDoc,
  }) async {
    try {
      return await _fireBaseService.getProducts(startAfterDoc: startAfterDoc);
    } catch (e) {
      rethrow;
    }
  }
}
