import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product.dart';

abstract class ProductState {
  List<ProductModel>? data;
  DocumentSnapshot? lastDoc;
  ProductState({this.data, this.lastDoc});
}

//This is innitial state of bloc
class ProductInitial extends ProductState {}

//This is the loading state of bloc
class ProductLoading extends ProductState {}

//This is the loading state of bloc
class ProductPaginating extends ProductState {
  List<ProductModel>? data;
  DocumentSnapshot? lastDoc;
  ProductPaginating({this.data, this.lastDoc});
}

//This is the success state of bloc
class ProductSuccess extends ProductState {
  List<ProductModel>? data;
  DocumentSnapshot? lastDoc;
  ProductSuccess({this.data, this.lastDoc});
}

//This is the error state of bloc
class ProductError extends ProductState {
  List<ProductModel>? data;
  DocumentSnapshot? lastDoc;
  late final dynamic error;
  ProductError({this.data, this.lastDoc, this.error});
}
