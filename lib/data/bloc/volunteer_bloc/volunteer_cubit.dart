import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/card_model.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {
  VolunteerCubit() : super(VolunteerState(list: CardModel.list));

  Future changeLike({required CardModel cardModel}) async {
    var list = CardModel.list;

    for (var element in list) {
      if (cardModel.title == element.title) {
        element.isFavorite = !cardModel.isFavorite!;
      }
    }
    emit(state.copyWith(list: list));
  }
}
