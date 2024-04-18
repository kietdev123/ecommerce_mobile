import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '../../repository/product/product_imp.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  //Product repo instance
  final _ProductRepo = ProductRepoImp();

  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_getData);
    on<PaginatingProductEvent>(_paginatingData);
  }

  Future<void> _getData(ProductEvent event, Emitter<ProductState> emit) async {
    if (state is! ProductInitial) return;
    emit(ProductLoading());
    if (event is GetProductEvent) {
      try {
        final (data, last) = await _ProductRepo.getProducts();

        emit(ProductSuccess(data: data, lastDoc: last));
      } catch (e) {
        print(e);
        emit(ProductError(data: [], error: e.toString()));
      }
    }
  }

  Future<void> _paginatingData(
      ProductEvent event, Emitter<ProductState> emit) async {
    if (state.data != null) {
      if (state.data!.length % 5 != 0) {
        return;
      }
    }
    if (state is ProductPaginating) return;

    if (event is PaginatingProductEvent) {
      print('product paginating');
      emit(ProductPaginating(data: state.data, lastDoc: state.lastDoc));

      try {
        final (data, last) =
            await _ProductRepo.getProducts(startAfterDoc: state.lastDoc);

        emit(ProductSuccess(data: state.data!.toList() + data, lastDoc: last));
      } catch (e) {
        print(e);
        emit(ProductError(
            data: state.data, lastDoc: state.lastDoc, error: e.toString()));
      }
    }
  }
}
