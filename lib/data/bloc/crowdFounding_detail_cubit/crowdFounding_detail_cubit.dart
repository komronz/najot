import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/bloc/crowdFounding_detail_cubit/crowdFounding_detail_state.dart';


class CrowdFoundingDetailCubit extends Cubit<CrowdFoundingDetailState> {
  CrowdFoundingDetailCubit() : super(CrowdFoundingDetailState(0));

  void tabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
