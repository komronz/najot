import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/charity_model.dart';

part 'my_charity_support_list_state.dart';

class MyCharitySupportListCubit extends Cubit<MyCharitySupportListState> {
  static MyCharitySupportListCubit get to => GetIt.I<MyCharitySupportListCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<MyCharitySupportListCubit>(MyCharitySupportListCubit());
  }
  MyCharitySupportListCubit() : super(MyCharitySupportListState(cardList: CharityModel.list));
}