import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/bloc/kraudfanding_cubit/kraud_fanding_cubit.dart';

part 'kraudfanding_detail_state.dart';

class KraudfandingDetailCubit extends Cubit<KraudfandingDetailState> {
  KraudfandingDetailCubit() : super(KraudfandingDetailState(0));




  void tabChange(int tabChange){

    emit(state.copyWith(tabChange: tabChange));
  }
}
