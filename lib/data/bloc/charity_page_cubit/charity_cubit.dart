import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/charity_saved_service.dart';

import '../../services/volunteer_service.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(CharityState(checkBox: false));

  Future Load() async {
    try {
      var list = await CharitySavedService().getCharityList();
      emit(state.copyWith(list: list, tobeVolunteer: Volunteer.tobeVolunteer));
    } catch (e) {}
  }

  void loading() {
    emit(state.copyWith());
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future onChangeSave(bool v) async {
    var list = await CharitySavedService().getCharityList();
    emit(state.copyWith(saveHelp: v, list: list));
  }
}
