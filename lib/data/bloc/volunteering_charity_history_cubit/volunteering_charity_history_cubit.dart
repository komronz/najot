import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/charity_model.dart';
import '../../model/kraufanding_model.dart';
import '../../services/charity_history_service.dart';

part 'volunteering_charity_history_state.dart';

class VolunteeringCharityHistoryCubit extends Cubit<VolunteeringCharityHistoryState> {
  VolunteeringCharityHistoryCubit() : super(VolunteeringCharityHistoryState());
  var service = CharityHistoryService();

  Future loadHistory() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 4));
    try {

      ///TODO cardmodelni kraufanding modelga o'zgartirish
      /// TODO: WARNING: crowdFounding
      var kraufandingList = await service.getKraufandingList();
      var charityList = await service.getCharityList();
      var itemsCharity = await service.getItemsList();

      emit(
        state.copyWith(
          charityList: charityList,
          kraufandingList: kraufandingList,
          itemsCharity: itemsCharity,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
  }

  Future search(String text) async {
    List<CharityModel> list = [];
    var charityList = await service.getCharityList();

    if (text.isEmpty) {
      emit(state.copyWith(charityList: charityList));
    } else {
      charityList!.forEach((element) {
        if (element.title!.toUpperCase().contains(text.toUpperCase())) {
          list.add(element);
        }
      });
      emit(state.copyWith(charityList: list));
    }
  }
}
