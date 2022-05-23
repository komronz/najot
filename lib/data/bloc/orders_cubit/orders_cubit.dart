import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/bloc/orders_cubit/orders_state.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/services/order_service.dart';
import 'package:najot/data/services/orders_service.dart';


class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState());
  OrderService orderService=OrderService();

  Future load() async {
    var orderServiceModel = await orderService.getModel();
    emit(state.copyWith(isLoading: true, hasError: false,),);
    if(orderServiceModel!=null){
      emit(state.copyWith(isLoading: false, list: orderServiceModel.results));
    }else{
      emit(state.copyWith(isLoading: false, hasError: true,),);
    }
    // emit(state.copyWith(isLoading: true));
    // await Future.delayed(Duration(seconds: 3));
    //
    // emit(state.copyWith(isLoading: false, list: []));
    // await Future.delayed(Duration(seconds: 3));
    //
    // emit(state.copyWith(isLoading: true));
    // await Future.delayed(Duration(seconds: 3));
    //
    // emit(state.copyWith(isLoading: false, list: orderServiceModel!.results));
  }
}
