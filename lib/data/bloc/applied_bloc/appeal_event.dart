part of 'appeal_bloc.dart';

abstract class AppealEvent extends Equatable {
  const AppealEvent();
}

class AppealNameChanged extends AppealEvent {
  final String name;

  const AppealNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class AppealPhoneChanged extends AppealEvent {
  final String phone;

  const AppealPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class AppealTextChanged extends AppealEvent {
  final String appeal;

  const AppealTextChanged(this.appeal);

  @override
  List<Object?> get props => [appeal];
}

class AppealBtnEvent extends AppealEvent {
  @override
  List<Object?> get props => [];
}
