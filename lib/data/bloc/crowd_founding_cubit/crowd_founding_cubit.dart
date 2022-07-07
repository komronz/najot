import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';

part 'crowd_founding_state.dart';

class CrowdFoundingCubit extends Cubit<CrowdFoundingState> {
  static CrowdFoundingCubit get to => GetIt.I<CrowdFoundingCubit>();

  CrowdFoundingCubit() : super(CrowdFoundingState(cardList: CardModel.list));

  static Future init() async {
    GetIt.I.registerSingleton<CrowdFoundingCubit>(CrowdFoundingCubit());
  }

  Future cardItems() async {}
}
