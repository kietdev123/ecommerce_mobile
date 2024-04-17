import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../main.dart';
import '../../repository/product_type/product_type_imp.dart';
import 'product_type_event.dart';
import 'product_type_state.dart';

class ProductTypeBloc extends Bloc<ProductTypeEvent, ProductTypeState> {
  //ProductType repo instance
  final _productTypeRepo = ProductTypeRepoImp();

  ProductTypeBloc() : super(ProductTypeInitial()) {
    _getProductType;
    on<GetProductTypeEvent>(_getProductType);
  }

  Future<void> _getProductType(
      ProductTypeEvent event, Emitter<ProductTypeState> emit) async {
    emit(ProductTypeLoading());
    if (event is GetProductTypeEvent) {
      try {
        final data = await _productTypeRepo.getProductType();
        emit(ProductTypeSuccess(data: data));
      } on FirebaseAuthException catch (e) {
        print(e);

        emit(ProductTypeError(e.message));
      }
    }
  }
}
