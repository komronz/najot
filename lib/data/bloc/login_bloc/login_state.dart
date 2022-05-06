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
  final bool checkPhoneNumber;

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
    this.checkPhoneNumber = false,
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
    checkPhoneNumber
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
    bool? checkPhoneNumber,

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
    );
  }
}
