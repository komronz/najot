import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/slider_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static HomeCubit get to => GetIt.I<HomeCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<HomeCubit>(HomeCubit());
  }

  HomeCubit() : super(HomeState(sliderList: SliderModel.list));

  Future SliderItems() async {}
}
