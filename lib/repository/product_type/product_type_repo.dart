import 'package:ecommerce_mobile/data/models/product_type.dart';

abstract class ProductTypeRepo {
  Future<ProductTypeModel?> getProductType() async {}
}
