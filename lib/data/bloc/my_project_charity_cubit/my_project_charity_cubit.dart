import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'my_project_charity_state.dart';

class MyProjectCharityCubit extends Cubit<MyProjectCharityState> {
  MyProjectCharityCubit() : super(MyProjectCharityState(0));

  void tabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
