import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/slider_model.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {

 
  VolunteerCubit() : super(VolunteerInitial(SliderModel.list));






}
