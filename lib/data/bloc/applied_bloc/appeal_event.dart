part of 'appeal_bloc.dart';

abstract class AppealEvent extends Equatable {
  const AppealEvent();
}

class AppealNameChanged extends AppealEvent {
  final String name;

  AppealNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class AppealPhoneChanged extends AppealEvent {
  final String phoneNumber;

  AppealPhoneChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class AppealTextChanged extends AppealEvent {
  final String content;

  AppealTextChanged(this.content);

  @override
  List<Object?> get props => [content];
}

class AppealBtnEvent extends AppealEvent {

  @override
  List<Object?> get props => [];
}
class SendDateEvent extends AppealEvent {
  @override
  List<Object?> get props => [];
}
class GetAboutDataEvent extends AppealEvent {
  @override
  List<Object?> get props => [];
}
