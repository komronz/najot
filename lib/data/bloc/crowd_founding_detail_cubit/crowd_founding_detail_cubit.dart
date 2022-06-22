import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crowd_founding_detail_state.dart';

class CrowdFoundingDetailCubit extends Cubit<CrowdFoundingDetailState> {
  CrowdFoundingDetailCubit() : super(const CrowdFoundingDetailState(0));

  void tabChange(int tabChange) {
    emit(state.copyWith(tabChange: tabChange));
  }
}
