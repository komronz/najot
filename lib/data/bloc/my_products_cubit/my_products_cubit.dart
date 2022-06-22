import 'package:bloc/bloc.dart';
import 'package:najot/data/bloc/my_products_cubit/my_products_state.dart';
import 'package:najot/data/services/products_service.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(const MyProductsState());
  var service = ProductsService();

  Future load() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isLoading: false, list: []));
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));

    var list = service.getProducts();
    emit(state.copyWith(isLoading: false, list: list));
    // emit(state.copyWith(isLoading: true));
  }
}
