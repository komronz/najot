import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

part 'my_volunteering_state.dart';

class MyVolunteeringCubit extends Cubit<MyVolunteeringState> {
  MyVolunteeringCubit()
      : super(
          MyVolunteeringState(
            cardList: VolunteeringModel.list,
          ),
        );

  static MyVolunteeringCubit get to => GetIt.I<MyVolunteeringCubit>();

  static Future init() async {
    GetIt.I.registerSingleton<MyVolunteeringCubit>(MyVolunteeringCubit());
  }

  Future cardItems() async {}
}
