import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(ChangeState(isSelected: false));

  bool isSelected= false;


  void changeBox(bool isDo) {
    isSelected = isDo;
    emit(ChangeState(isSelected: isDo));
  }
}
