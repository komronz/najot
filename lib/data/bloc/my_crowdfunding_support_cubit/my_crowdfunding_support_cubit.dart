import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/kraufanding_model.dart';

import 'my_crowdfunding_support_state.dart';


class MyCrowdfundingSupportCubit extends Cubit<MyCrowdfundingSupportState> {
  static MyCrowdfundingSupportCubit get to =>
      GetIt.I<MyCrowdfundingSupportCubit>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<MyCrowdfundingSupportCubit>(
          MyCrowdfundingSupportCubit());
  }

  MyCrowdfundingSupportCubit()
      : super(MyCrowdfundingSupportState(
          cardList: KraufandingModel.list,
          widgetChange: false,
          isVisible: true
        ));

  void widgetChange(bool v){
    emit(state.copyWith(widgetChange: v));
  }
  void isVisibleChange(bool v){
    emit(state.copyWith(isVisible: v));
  }
}
