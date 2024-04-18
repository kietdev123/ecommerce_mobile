import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '../../repository/brand/brand_imp.dart';
import 'brand_event.dart';
import 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  //Brand repo instance
  final _BrandRepo = BrandRepoImp();

  BrandBloc() : super(BrandInitial(0)) {
    on<GetDataEvent>(_getData);
  }

  Future<void> _getData(BrandEvent event, Emitter<BrandState> emit) async {
    emit(BrandLoading());
    if (event is GetDataEvent) {
      try {
        await _BrandRepo.getBrand();

        emit(BrandSuccess());
      } catch (e) {
        print(e);
        emit(BrandError(e.toString()));
      }
    }
  }
}
