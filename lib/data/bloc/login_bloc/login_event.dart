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

class RegisSuccessChange extends LoginEvent {

  RegisSuccessChange(this.change);
  final bool change;

  @override
  List<Object?> get props => [change];
}
class LoginEnd extends LoginEvent{
  LoginEnd(this.code);
  int code;
  @override
  List<Object?> get props => [code];

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
  final int check;

  CheckPhoneNumberChanged(this.check);

  @override
  // TODO: implement props
  List<Object?> get props => [check];
}

class Registration extends LoginEvent {

  Registration();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}