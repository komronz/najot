import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/charity_model.dart';

import 'my_charity_support_list_state.dart';

class MyCharitySupportListCubit extends Cubit<MyCharitySupportListState> {
  static MyCharitySupportListCubit get to =>
      GetIt.I<MyCharitySupportListCubit>();

  static Future init() async {
    GetIt.I
      ..registerSingleton<MyCharitySupportListCubit>(
          MyCharitySupportListCubit());
  }

  MyCharitySupportListCubit()
      : super(MyCharitySupportListState(
          cardList: CharityModel.list,
          widgetChange: false,
        ));

  void widgetChange(bool v) {
    emit(state.copyWith(widgetChange: v));
  }
}
