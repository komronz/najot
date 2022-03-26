import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/card_model.dart';

part 'kraud_fanding_state.dart';

class KraudFandingCubit extends Cubit<KraudFandingState> {
  static KraudFandingCubit get to => GetIt.I<KraudFandingCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<KraudFandingCubit>(KraudFandingCubit());
  }

  KraudFandingCubit() : super(KraudFandingState(cardList: CardModel.list));

  Future CardItems() async {}
}
