import 'package:bloc/bloc.dart';
import 'package:najot/data/bloc/orders_cubit/orders_state.dart';
import 'package:najot/data/services/orders_service.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(const OrdersState());
  var service = OrdersService();

  Future load() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isLoading: false, list: []));
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));

    var list = await service.getOrderList();
    emit(state.copyWith(isLoading: false, list: list));
    // emit(state.copyWith(isLoading: true));
  }
}
