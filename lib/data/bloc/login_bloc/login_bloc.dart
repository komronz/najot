import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/model/user.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final MaskTextInputFormatter phoneNumberFormatter;

  LoginBloc()
      : phoneNumberFormatter =
            MaskTextInputFormatter(mask: "+### (##) ### ## ##"),
        super(LoginState()) {
    on<LoginFirstNameChanged>(_onFirstNameChanged);
    on<LoginLastNameChanged>(_onLastNameChanged);
    on<LoginAgreeChanged>(_onAgreeChanged);
    on<LoginPhoneChanged>(_onPhoneChanged);
    on<LoginSignIn>(_loginSignIn);
    on<LoginSignUp>(_loginSignUp);
  }

  var phone = "998991111111";

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
          state.phone,
          state.agree,
        ),
      ),
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
        state.phone,
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
        event.phone,
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
          state.phone,
          state.agree,
        ),
      ),
    );
  }

  bool _nextBtnActive(
    String firstName,
    String lastName,
    String phone,
    bool agree,
  ) {
    if (_isNotEmpty(firstName) &&
        _isNotEmpty(lastName) &&
        _isNotEmpty(phone) &&
        agree) {
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

  Future _loginSignIn(
    LoginSignIn event,
    Emitter<LoginState> emit,
  ) async {
    var user = User(
      firstName: state.firstName,
      lastName: state.lastName,
      phone: state.phone,
    );
    AppLoggerUtil.i(phoneNumberFormatter.getUnmaskedText());
    AppLoggerUtil.i(phone);
    if (phone == phoneNumberFormatter.getUnmaskedText()) {
      AppWidgets.showText(text: 'Success');
      NavigatorService.to.pushNamedAndRemoveUntil(HomePage.routeName);
      emit(state.copyWith(hasError: false));
    } else {
      emit(state.copyWith(hasError: true));
    }
    AppLoggerUtil.i(user.toJson().toString());
  }

  Future _loginSignUp(
    LoginSignUp event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(hasError: false));
  }
}