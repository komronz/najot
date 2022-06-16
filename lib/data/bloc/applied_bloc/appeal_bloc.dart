import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/model/about_us_model.dart';
import 'package:najot/data/services/about_us_service.dart';

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
    on<SendDateEvent>(_onBtnSend);
  }

  final AboutUsService aboutUsService=AboutUsService();
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
          state.content,
          state.phoneNumber,
        ),
      ),
    );
  }

  bool _isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
  bool _isEmpty(String value) {
    return value.trim().isEmpty;
  }


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
        phoneNumber: event.phoneNumber,
        phoneFill: _isNotEmpty(event.phoneNumber),
        isNextBtnActive: _nextBtnActive(
          state.name,
          state.content,
          event.phoneNumber,
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
        content: event.content,
        applyFill: _isNotEmpty(event.content),
        isNextBtnActive: _nextBtnActive(
          state.name,
          event.content,
          state.phoneNumber,
        ),
      ),

    );
  }

  Future _onBtnPressed(
    AppealBtnEvent event,
    Emitter<AppealState> emit,
  ) async {
    emit(
      AppealState(name: "",
          phoneNumber: "",
          content: ""
      ),

    );
  }
  Future _onBtnSend(
      SendDateEvent event,
      Emitter<AppealState> emit,
      ) async {
    AboutUs? aboutUs =await aboutUsService.postModel(state.name, state.phoneNumber, state.content);
    if(aboutUs !=null){
      emit(state.copyWith(isLoading: true));
    }else{
      emit(state.copyWith(hasError: true));
    }
  }
}
