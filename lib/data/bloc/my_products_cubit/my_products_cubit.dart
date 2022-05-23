import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/bloc/my_products_cubit/my_products_state.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/orders_service.dart';
import 'package:najot/data/services/products_service.dart';


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

    var list = await service.getProducts();
    emit(state.copyWith(isLoading: false, list: list));
    // emit(state.copyWith(isLoading: true));

  }
}
