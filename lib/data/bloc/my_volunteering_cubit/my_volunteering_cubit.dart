import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

part 'my_volunteering_state.dart';

class MyVolunteeringCubit extends Cubit<MyVolunteeringState> {
  static MyVolunteeringCubit get to => GetIt.I<MyVolunteeringCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<MyVolunteeringCubit>(MyVolunteeringCubit());
  }

  MyVolunteeringCubit() : super(MyVolunteeringState(cardList: VolunteeringModel.list));

  Future CardItems() async {}
}
