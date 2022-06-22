import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

part 'my_volunteering_project_state.dart';

class MyVolunteeringProjectCubit extends Cubit<MyVolunteeringProjectState> {
  static MyVolunteeringProjectCubit get to =>
      GetIt.I<MyVolunteeringProjectCubit>();

  static Future init() async {
    GetIt.I.registerSingleton<MyVolunteeringProjectCubit>(
        MyVolunteeringProjectCubit());
  }

  MyVolunteeringProjectCubit()
      : super(MyVolunteeringProjectState(
          cardList: VolunteeringModel.list,
          widgetChange: false,
        ));

  void widgetChange(bool v) {
    emit(state.copyWith(widgetChange: v));
  }
}
