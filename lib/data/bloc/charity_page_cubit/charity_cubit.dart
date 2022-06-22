import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/charity_saved_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';

import '../../services/volunteer_service.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(const CharityState(checkBox: false));

  Future load() async {
    try {
      var list = CharitySavedService().getCharityList();
      emit(state.copyWith(list: list, tobeVolunteer: Volunteer.tobeVolunteer));
    } catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }

  void loading() {
    emit(state.copyWith());
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future onChangeSave(bool v) async {
    var list = CharitySavedService().getCharityList();
    emit(state.copyWith(saveHelp: v, list: list));
  }
}
