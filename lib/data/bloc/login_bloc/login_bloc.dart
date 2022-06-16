import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/model/auth_model/token_model.dart';
import 'package:najot/data/model/auth_model/user.dart';
import 'package:najot/data/services/auth_service.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final MaskTextInputFormatter phoneNumberFormatter;

  LoginBloc()
      : phoneNumberFormatter = MaskTextInputFormatter(mask: "## ### ## ##"),
        super(LoginState()) {
    on<LoginFirstNameChanged>(_onFirstNameChanged);
    on<LoginLastNameChanged>(_onLastNameChanged);
    on<LoginAgreeChanged>(_onAgreeChanged);
    on<LoginPhoneChanged>(_onPhoneChanged);
    on<RegisSuccessChange>(_loginSignIn);
    on<LoginEnd>(_loginEnd);
    on<CheckPhoneNumber>(_checkPhoneNumber);
    on<CheckPhoneNumberChanged>(_checkPhoneNumberChanged);
    on<LoginAuthSuccess>(_onAuthSuccess);
    on<Registration>(_registration);
  }

  final AuthService authService = AuthService();

  void uiChange() {
    emit(state.copyWith());
  }

  Future _onFirstNameChanged(
    LoginFirstNameChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        firstName: event.firstName,
        firstNameFill: _isNotEmpty(event.firstName),
        signBtnActive: _signBtnActive(event.firstName, state.phone),
        isNextBtnActive: _nextBtnActive(
          event.firstName,
          state.lastName,
          state.agree,
        ),
      ),
    );
  }

  Future _onAuthSuccess(
    LoginAuthSuccess event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(authSuccess: event.authSuccess),
    );
  }

  Future _onAgreeChanged(
    LoginAgreeChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      agree: event.isAgree,
      isNextBtnActive: _nextBtnActive(
        state.firstName,
        state.lastName,
        event.isAgree,
      ),
    ));
  }

  Future _onPhoneChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      phone: event.phone,
      phoneFill: _isNotEmpty(event.phone),
      signBtnActive: _signBtnActive(state.firstName, event.phone),
      isNextBtnActive: _nextBtnActive(
        state.firstName,
        state.lastName,
        state.agree,
      ),
    ));
  }

  Future _onLastNameChanged(
    LoginLastNameChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        lastName: event.lastName,
        lastNameFill: _isNotEmpty(event.lastName),
        isNextBtnActive: _nextBtnActive(
          state.firstName,
          event.lastName,
          state.agree,
        ),
      ),
    );
  }

  bool _nextBtnActive(
    String firstName,
    String lastName,
    bool agree,
  ) {
    if (_isNotEmpty(firstName) && _isNotEmpty(lastName) && agree) {
      return true;
    }
    return false;
  }

  bool get isNextBtnActive {
    if (_isEmpty(state.firstName) ||
        _isEmpty(state.lastName) ||
        _isEmpty(state.phone) ||
        !state.agree) {
      return false;
    }
    return true;
  }

  bool _isEmpty(String value) {
    return value.trim().isEmpty;
  }

  bool _isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  bool _signBtnActive(String firstName, String phone) {
    if (_isNotEmpty(firstName) && _isNotEmpty(phone)) {
      return true;
    }
    return false;
  }

  bool get signBtnActive {
    if (_isNotEmpty(state.firstName) && _isNotEmpty(state.phone)) {
      return true;
    }
    return false;
  }

  void _loginSignIn(
    RegisSuccessChange event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(registerSuccess: event.change));
  }

  void _checkPhoneNumberChanged(
    CheckPhoneNumberChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(checkPhoneNumber: event.check));
  }

  Future _checkPhoneNumber(
    CheckPhoneNumber event,
    Emitter<LoginState> emit,
  ) async {
    if (state.phone.length == 12) {
      emit(state.copyWith(hasError: false));
      var checkPhoneNumber = await authService.confirmPhoneNumber(state.phone);
      if (checkPhoneNumber != null) {
        AppWidgets.isLoading(true);
        if (checkPhoneNumber.isExists == true) {
          var codeToken =
              await authService.registration(state.phone, "string", "string");
          emit(state.copyWith(codeToken: codeToken!.token));
          emit(state.copyWith(checkPhoneNumber: 1));
          AppWidgets.isLoading(false);
        } else {
          emit(state.copyWith(checkPhoneNumber: -1));
          AppWidgets.isLoading(false);
        }
      } else {
        emit(state.copyWith(hasError: true));
      }
    } else {
      emit(state.copyWith(hasError: true));
    }
  }

  Future _registration(
    Registration event,
    Emitter<LoginState> emit,
  ) async {
    AppWidgets.isLoading(true);
    emit(state.copyWith(hasError: false));
    var codeToken = await authService.registration(
      state.phone,
      state.firstName,
      state.lastName,
    );
    if (codeToken != null) {
      emit(state.copyWith(codeToken: codeToken.token));
      emit(state.copyWith(registerSuccess: true));
      AppWidgets.isLoading(false);

    } else {
      emit(state.copyWith(hasError: true));
      AppWidgets.isLoading(false);

    }
    AppWidgets.isLoading(false);
  }

  Future _loginEnd(
    LoginEnd event,
    Emitter<LoginState> emit,
  ) async {
    AppWidgets.isLoading(true);
    var loginEndModel = await authService.loginEnd(
      event.code,
      state.codeToken,
    );

    if (loginEndModel != null) {
      HiveService.to.setToken(loginEndModel.access!);
      emit(state.copyWith(loginSuccess: true));
      AppWidgets.isLoading(false);
    }
    AppWidgets.isLoading(false);
  }
}
