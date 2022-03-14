import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/slider_model.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {
  VolunteerCubit() : super(VolunteerState(list: SliderModel.list));

  Future changeLike({required SliderModel sliderModel}) async {
    var list = await SliderModel.list;

    list.forEach((element) {
      if (sliderModel.title == element.title) {
        element.like = !sliderModel.like;
      }
    });
    emit(state.copyWith(list: list));
  }
}
