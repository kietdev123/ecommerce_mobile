import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product.dart';

abstract class ProductRepo {
  Future<(List<ProductModel>, DocumentSnapshot?)?> getProducts({
    int limit = 5,
    DocumentSnapshot<Object?>? startAfterDoc,
  }) async {}
}
