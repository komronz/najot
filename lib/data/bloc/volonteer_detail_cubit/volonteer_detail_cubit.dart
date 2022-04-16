import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';

part 'volonteer_detail_state.dart';

class VolonteerDetailCubit extends Cubit<VolunteerDetailState> {
  VolonteerDetailCubit() : super(VolunteerDetailState(checkBox: false));




  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }
}
