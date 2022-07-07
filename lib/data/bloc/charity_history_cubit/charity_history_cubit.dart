import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/model/crowd_founding_model.dart';
import 'package:najot/data/services/charity_history_service.dart';

part 'charity_history_state.dart';

class CharityHistoryCubit extends Cubit<CharityHistoryState> {
  CharityHistoryCubit() : super(const CharityHistoryState());
  var service = CharityHistoryService();

  Future loadHistory() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 4));
    try {
      var charityList = await service.getCharityList();

      var crowdFounding = await service.getCrowdFoundingList();

      emit(
        state.copyWith(
          charityList: charityList,
          crowdFoundingList: crowdFounding,
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
      emit(
        state.copyWith(
          charityList: charityList,
        ),
      );
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
