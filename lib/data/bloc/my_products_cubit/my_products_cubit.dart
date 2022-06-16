import 'package:bloc/bloc.dart';
import 'package:najot/data/bloc/my_products_cubit/my_products_state.dart';

import '../../services/product_service.dart';


class MyProductsCubit extends Cubit<MyProductsState> {
  MyProductsCubit() : super(MyProductsState());
  var service = ProductService();

  Future load() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 3));

    emit(state.copyWith(isLoading: false, list: []));
    await Future.delayed(Duration(seconds: 3));

    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 3));


    emit(state.copyWith(isLoading: false, ));
    // emit(state.copyWith(isLoading: true));

  }
}
