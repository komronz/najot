import 'package:bloc/bloc.dart';
import 'package:najot/data/bloc/orders_cubit/orders_state.dart';
import 'package:najot/data/model/oreder_model.dart';
import 'package:najot/data/services/order_service.dart';


class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState());
  OrderService orderService=OrderService();

  Future load() async {
    emit(state.copyWith(isLoading: true, hasError: false,),);
    var orderServiceModel = await orderService.getModel();
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

  Future isClick(int index) async {
    List<OrderModelResults> list=List.from(state.list);
    list[index].isClick = !(list[index].isClick ?? false);
    emit(state.copyWith(list: list));
  }
}
