import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

import '../../model/card_model.dart';
import '../../model/charity_model.dart';
import '../../model/kraufanding_model.dart';

part 'my_charity_project_state.dart';

class MyCharityProjectCubit extends Cubit<MyCharityProjectState> {
  static MyCharityProjectCubit get to => GetIt.I<MyCharityProjectCubit>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<MyCharityProjectCubit>(MyCharityProjectCubit());
  }

  MyCharityProjectCubit()
      : super(MyCharityProjectState(
            volunteeringList: VolunteeringModel.list,
            charityList: CharityModel.list,
            kraufandingList: KraufandingModel.list));
}
