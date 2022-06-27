import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/volunteer_project_service.dart';

import '../../services/volunteer_service.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {

  static VolunteerCubit get to => GetIt.I<VolunteerCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<VolunteerCubit>(VolunteerCubit());
    VolunteerCubit.to.load();
  }
  VolunteerCubit() : super(VolunteerState());
  VolunteerProjectService service= VolunteerProjectService();

  Future changeLike({required CardModel cardModel}) async {
    var list = await CardModel.list;

    list.forEach((element) {
      if (cardModel.title == element.title) {
        element.isFavorite = !cardModel.isFavorite!;
      }
    });
    // emit(state.copyWith(list: list));
  }

  Future load() async {

    emit(state.copyWith(loading: true));
    var volunteerModel = await service.getVolunteerModel();

    if (volunteerModel != null) {

      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(loading: false));
      emit(state.copyWith(
        list: volunteerModel.results!,
        checkBox: false,
        tobeVolunteer: Volunteer.tobeVolunteer,
      ));
    }
  }

  void loading() {
    emit(state.copyWith());
  }

  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  void onChangeSave(bool v) {
    emit(state.copyWith(saveHelp: v));
  }
}
