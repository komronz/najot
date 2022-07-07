import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/charity_model.dart';
import '../../model/crowd_founding_model.dart';
import '../../services/charity_history_service.dart';

part 'volunteering_charity_history_state.dart';

class VolunteeringCharityHistoryCubit
    extends Cubit<VolunteeringCharityHistoryState> {
  VolunteeringCharityHistoryCubit()
      : super(const VolunteeringCharityHistoryState());
  var service = CharityHistoryService();

  Future loadHistory() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 4));
    try {
      var crowdFoundingList = await service.getCrowdFoundingList();
      var charityList = await service.getCharityList();
      var itemsCharity = await service.getItemsList();

      emit(
        state.copyWith(
          charityList: charityList,
          kraufandingList: crowdFoundingList,
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
      for (var element in charityList!) {
        if (element.title!.toUpperCase().contains(text.toUpperCase())) {
          list.add(element);
        }
      }
      emit(state.copyWith(charityList: list));
    }
  }
}
