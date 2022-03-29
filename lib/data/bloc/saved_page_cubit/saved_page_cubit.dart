import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/charity_saved_service.dart';

import '../../model/charity_model_for_saved.dart';



part 'saved_page_state.dart';

class SavedPageCubit extends Cubit<SavedPageState> {
  SavedPageCubit() : super(SavedPageState());
  var service = CharitySavedService();

  Future loadHistory() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 4));
    try {
      var charitySavedList = await service.getCharityList();

      ///TODO cardmodelni kraufanding modelga o'zgartirish
      var kraufandingSavedList = await service.getKraufandingList();

      emit(
        state.copyWith(
          charitySavedList: charitySavedList,
          kraufandingSavedList: kraufandingSavedList,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
  }

  // Future search(String text) async {
  //   List<CharityModel> list = [];
  //   var charityList = await service.getCharityList();
  //
  //   if (text.isEmpty) {
  //     emit(state.copyWith(charityList: charityList));
  //   } else {
  //     charityList!.forEach((element) {
  //       if (element.title!.toUpperCase().contains(text.toUpperCase())) {
  //         list.add(element);
  //       }
  //     });
  //     emit(state.copyWith(charityList: list));
  //   }
  // }
}
