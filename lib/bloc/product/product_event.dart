import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product.dart';

abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {}

class PaginatingProductEvent extends ProductEvent {}
