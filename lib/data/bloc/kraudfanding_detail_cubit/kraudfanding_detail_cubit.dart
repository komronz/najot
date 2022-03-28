import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kraudfanding_detail_state.dart';

class KraudfandingDetailCubit extends Cubit<KraudfandingDetailState> {
  KraudfandingDetailCubit() : super(KraudfandingDetailInitial());
}
