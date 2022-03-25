import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/orders_service.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState());
  var service = OrdersService();

  Future load() async {
    emit(state.copyWith(isLoading: true));
    var list = await service.getOrderList();
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(isLoading: false, list: list));
  }
}
