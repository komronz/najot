import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_project_charity_state.dart';

class MyProjectCharityCubit extends Cubit<MyProjectCharityState> {
  MyProjectCharityCubit() : super(const MyProjectCharityState(0));

  void tabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
