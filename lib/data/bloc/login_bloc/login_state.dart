part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final bool agree;
  final bool firstNameFill;
  final bool lastNameFill;
  final bool phoneFill;
  final bool isNextBtnActive;
  final bool signBtnActive;
  final bool hasError;
  final bool codeError;
  final bool authSuccess;
  final bool loginSuccess;
  final bool registerSuccess;
  final bool sendCodeDuration;
  final int checkPhoneNumber;
  final String codeToken;
  final int code;
  final int blockedTime;

  const LoginState({
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.isNextBtnActive = false,
    this.agree = false,
    this.firstNameFill = false,
    this.lastNameFill = false,
    this.phoneFill = false,
    this.signBtnActive = false,
    this.hasError = false,
    this.codeError = false,
    this.authSuccess = false,
    this.loginSuccess = false,
    this.registerSuccess = false,
    this.sendCodeDuration = false,
    this.checkPhoneNumber=0,
    this.codeToken = "",
    this.code=0,
    this.blockedTime=0,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phone,
        isNextBtnActive,
        agree,
        firstNameFill,
        lastNameFill,
        phoneFill,
        signBtnActive,
        hasError,
    codeError,
    authSuccess,
    checkPhoneNumber,
    codeToken,
    code,
    loginSuccess,
    registerSuccess,
    blockedTime,
    sendCodeDuration
      ];

  LoginState copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    bool? isNextBtnActive,
    bool? agree,
    bool? firstNameFill,
    bool? lastNameFill,
    bool? phoneFill,
    bool? signBtnActive,
    bool? hasError,
    bool? codeError,
    bool? authSuccess,
    bool? loginSuccess,
    bool? registerSuccess,
    bool? sendCodeDuration,
    int? checkPhoneNumber,
    String? codeToken,
    int? code,
    int? blockedTime,

  }) {
    return LoginState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      isNextBtnActive: isNextBtnActive ?? this.isNextBtnActive,
      agree: agree ?? this.agree,
      firstNameFill: firstNameFill ?? this.firstNameFill,
      lastNameFill: lastNameFill ?? this.lastNameFill,
      phoneFill: phoneFill ?? this.phoneFill,
      signBtnActive: signBtnActive ?? this.signBtnActive,
      hasError: hasError ?? this.hasError,
      codeError: codeError ?? this.codeError,
      authSuccess: authSuccess ?? this.authSuccess,
      checkPhoneNumber: checkPhoneNumber ?? this.checkPhoneNumber,
      codeToken: codeToken ?? this.codeToken,
      code: code ?? this.code,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      registerSuccess: registerSuccess ?? this.registerSuccess,
      blockedTime: blockedTime ?? this.blockedTime,
      sendCodeDuration: sendCodeDuration ?? this.sendCodeDuration,
    );
  }
}
