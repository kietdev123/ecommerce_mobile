
import '../../data/models/brand.dart';

abstract class BrandState {}

//This is innitial state of bloc
class BrandInitial extends BrandState {
  late final int value;
  BrandInitial(this.value);
}

//This is the loading state of bloc
class BrandLoading extends BrandState {}

//This is the success state of bloc
class BrandSuccess extends BrandState {
  BrandModel? data;
  BrandSuccess({this.data});
}

//This is the error state of bloc
class BrandError extends BrandState {
  late final dynamic error;
  BrandError(this.error);
}
