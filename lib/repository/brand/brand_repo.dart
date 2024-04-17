
import '../../data/models/brand.dart';

abstract class BrandRepo {
  Future<BrandModel?> getBrand() async {}
}
