import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/crowd_founding_model.dart';

import 'my_crowdfunding_support_state.dart';

class MyCrowdfundingSupportCubit extends Cubit<MyCrowdfundingSupportState> {
  MyCrowdfundingSupportCubit()
      : super(MyCrowdfundingSupportState(
          cardList: CrowdFoundingModel.list,
          widgetChange: false,
          isVisible: true,
        ));

  static MyCrowdfundingSupportCubit get to =>
      GetIt.I<MyCrowdfundingSupportCubit>();

  static Future init() async {
    GetIt.I.registerSingleton<MyCrowdfundingSupportCubit>(
        MyCrowdfundingSupportCubit());
  }

  void widgetChange(bool v) {
    emit(state.copyWith(widgetChange: v));
  }

  void isVisibleChange(bool v) {
    emit(state.copyWith(isVisible: v));
  }
}
