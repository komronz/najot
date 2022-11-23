import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/auth_model/token_model.dart';
import 'package:najot/data/model/auth_model/user.dart';
import 'package:najot/data/model/blocked_model.dart';
import 'package:najot/data/services/auth_service.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/main_service.dart';
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
    on<ResendCode>(_resendCode);
  }

  final AuthService authService = AuthService();
  final MainService mainService = MainService();


  void uiChange() {
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
    var  internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
      if (state.phone.length == 12) {
        emit(state.copyWith(hasError: false));
        var checkPhoneNumber = await authService.confirmPhoneNumber(state.phone);
        if (checkPhoneNumber != null) {
          AppWidgets.isLoading(true);
          if (checkPhoneNumber.isExists == true) {
            var codeToken = await authService.registration(state.phone, "string", "string");
            if(codeToken is TokenModel){
              emit(state.copyWith(codeToken: codeToken.token,checkPhoneNumber: 1));

            }
            if(codeToken is BlockedModel){
              int a=codeToken.retryAfter!~/3600;
              int b=(codeToken.retryAfter!-a*3600)~/60;
              emit(state.copyWith(blockedTime: codeToken.retryAfter));

              AppWidgets.showText(text: "Raqamingiz ${a} soat ${b} minutga bloklangan!");

            }
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
    }else{
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }

  }

  Future _resendCode(
      ResendCode event,
      Emitter<LoginState> emit,
      ) async {
    var  internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
      emit(state.copyWith(sendCodeDuration: true));
      var codeToken = await authService.resendCode(
          state.codeToken
      );
      if (codeToken == true) {
        emit(state.copyWith(sendCodeDuration: false));

      } else {
        emit(state.copyWith(sendCodeDuration: false));
        AppWidgets.showText(text: LocaleKeys.number_been_blocked.tr());


      }
    }else{
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }

  }

  Future _registration(
    Registration event,
    Emitter<LoginState> emit,
  ) async {
    var  internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
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
    }else{
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }

  }

  Future _loginEnd(
    LoginEnd event,
    Emitter<LoginState> emit,
  ) async {
    var  internetConnection = await mainService.checkInternetConnection();
    if(internetConnection){
      AppWidgets.isLoading(true);
      var loginEndModel = await authService.loginEnd(
        event.code,
        state.codeToken,
      );

      if (loginEndModel != null) {
        HiveService.to.setToken(loginEndModel);
        emit(state.copyWith(loginSuccess: true));
        event.callBack.call();
        AppWidgets.isLoading(false);
      }
      AppWidgets.isLoading(false);
      emit(state.copyWith(codeError: true));
    }else{
      AppWidgets.showText(text: LocaleKeys.disConnection.tr());
    }

  }
}
