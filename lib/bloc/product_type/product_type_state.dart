import '../../data/models/product_type.dart';

abstract class ProductTypeState {}

//This is innitial state of bloc
class ProductTypeInitial extends ProductTypeState {}

//This is the loading state of bloc
class ProductTypeLoading extends ProductTypeState {}

//This is the success state of bloc
class ProductTypeSuccess extends ProductTypeState {
  ProductTypeModel? data;
  ProductTypeSuccess({this.data});
}

//This is the error state of bloc
class ProductTypeError extends ProductTypeState {
  late final dynamic error;
  ProductTypeError(this.error);
}
