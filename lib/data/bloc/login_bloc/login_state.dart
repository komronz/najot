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
  final bool authSuccess;
  final bool loginSuccess;
  final bool registerSuccess;
  final int checkPhoneNumber;
  final String codeToken;
  final int code;

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
    this.authSuccess = false,
    this.loginSuccess = false,
    this.registerSuccess = false,
    this.checkPhoneNumber=0,
    this.codeToken = "",
    this.code=0,
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
    authSuccess,
    checkPhoneNumber,
    codeToken,
    code,
    loginSuccess,
    registerSuccess
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
    bool? authSuccess,
    bool? loginSuccess,
    bool? registerSuccess,
    int? checkPhoneNumber,
    String? codeToken,
    int? code,

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
      authSuccess: authSuccess ?? this.authSuccess,
      checkPhoneNumber: checkPhoneNumber ?? this.checkPhoneNumber,
      codeToken: codeToken ?? this.codeToken,
      code: code ?? this.code,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      registerSuccess: registerSuccess ?? this.registerSuccess,
    );
  }
}
