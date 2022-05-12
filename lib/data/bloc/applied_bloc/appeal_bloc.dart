import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'appeal_event.dart';
part 'applied_state.dart';

class AppealBloc extends Bloc<AppealEvent, AppealState> {
  final MaskTextInputFormatter phoneNumberFormatter;

  AppealBloc()
      : phoneNumberFormatter =
            MaskTextInputFormatter(mask: "+### (##) ### ## ##"),
        super(AppealState()) {
    on<AppealNameChanged>(_onNameChanged);
    on<AppealPhoneChanged>(_onPhoneChanged);
    on<AppealTextChanged>(_onAppealTxtChanged);
    on<AppealBtnEvent>(_onBtnPressed);
  }

  Future _onNameChanged(
    AppealNameChanged event,
    Emitter<AppealState> emit,
  ) async {
    emit(
      state.copyWith(
        firstName: event.name,
        firstNameFill: _isNotEmpty(event.name),
        isNextBtnActive: _nextBtnActive(
          event.name,
          state.applyText,
          state.phone,
        ),
      ),
    );
  }

  bool _isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  // bool _isEmpty(String value) {
  //   return value.trim().isEmpty;
  // }

  bool _nextBtnActive(
    String firstName,
    String appealText,
    String phone,
  ) {
    if (_isNotEmpty(firstName) &&
        _isNotEmpty(phone) &&
        _isNotEmpty(appealText)) {
      return true;
    }
    return false;
  }

  Future _onPhoneChanged(
    AppealPhoneChanged event,
    Emitter<AppealState> emit,
  ) async {
    emit(
      state.copyWith(
        phone: event.phone,
        phoneFill: _isNotEmpty(event.phone),
        isNextBtnActive: _nextBtnActive(
          state.firstName,
          state.applyText,
          event.phone,
        ),
      ),
    );
  }

  Future _onAppealTxtChanged(
    AppealTextChanged event,
    Emitter<AppealState> emit,
  ) async {
    emit(
      state.copyWith(
        applyText: event.appeal,
        applyFill: _isNotEmpty(event.appeal),
        isNextBtnActive: _nextBtnActive(
          state.firstName,
          event.appeal,
          state.phone,
        ),
      ),
    );
  }

  Future _onBtnPressed(
    AppealBtnEvent event,
    Emitter<AppealState> emit,
  ) async {
    emit(
      state.copyWith(firstName: "", phone: "", applyText: ""),
    );
  }
}
