import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'kraudfanding_detail_state.dart';

class KraudfandingDetailCubit extends Cubit<KraudfandingDetailState> {
  KraudfandingDetailCubit() : super(KraudfandingDetailState(0));

  void tabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
