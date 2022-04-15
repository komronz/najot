import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'charity_full_state.dart';

class CharityFullCubit extends Cubit<CharityFullState> {
  CharityFullCubit() : super(CharityFullInitial());
}
