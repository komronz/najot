import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {
  VolunteerCubit() : super(VolunteerInitial());



}
