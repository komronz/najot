part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginFirstNameChanged extends LoginEvent {
  final String firstName;

  const LoginFirstNameChanged(this.firstName);

  @override
  List<Object?> get props => [firstName];
}

class LoginLastNameChanged extends LoginEvent {
  final String lastName;

  const LoginLastNameChanged(this.lastName);

  @override
  List<Object?> get props => [lastName];
}

class LoginPhoneChanged extends LoginEvent {
  final String phone;

  LoginPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class LoginSignIn extends LoginEvent {
  @override
  List<Object?> get props => [];
}
class LoginSignUp extends LoginEvent{
  @override
  List<Object?> get props => [];

}

class LoginAgreeChanged extends LoginEvent {
  final bool isAgree;

  LoginAgreeChanged(this.isAgree);

  @override
  List<Object?> get props => [isAgree];
}
class LoginAuthSuccess extends LoginEvent {
  final bool authSuccess;

  LoginAuthSuccess(this.authSuccess);

  @override
  List<Object?> get props => [authSuccess];
}

class CheckPhoneNumber extends LoginEvent {
@override
List<Object?> get props => [];
}



class CheckPhoneNumberChanged extends LoginEvent {
  final bool check;

  CheckPhoneNumberChanged(this.check);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}