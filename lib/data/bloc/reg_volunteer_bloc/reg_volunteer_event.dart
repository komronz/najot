part of 'reg_volunteer_bloc.dart';

@immutable
abstract class RegVolunteerEvent extends Equatable {
  const RegVolunteerEvent();
}

class VolunteerFirstNameChanged extends RegVolunteerEvent {
  final String firstName;

  const VolunteerFirstNameChanged(this.firstName);

  @override
  List<Object?> get props => [firstName];
}

class VolunteerLastNameChanged extends RegVolunteerEvent {
  final String lastName;

  const VolunteerLastNameChanged(this.lastName);

  @override
  List<Object?> get props => [lastName];
}

class VolunteerAddressChanged extends RegVolunteerEvent {
  final String address;

  const VolunteerAddressChanged(this.address);

  @override
  List<Object?> get props => [address];
}

class VolunteerGenderChanged extends RegVolunteerEvent {
  final int gender;

  const VolunteerGenderChanged(this.gender);

  @override
  List<Object?> get props => [gender];
}

class VolunteerBirthDateSelected extends RegVolunteerEvent {
  final DateTime birthDate;

  const VolunteerBirthDateSelected(this.birthDate);

  @override
  List<Object?> get props => [birthDate];
}

class VolunteerSerialChanged extends RegVolunteerEvent {
  final String serial;

  const VolunteerSerialChanged(this.serial);

  @override
  List<Object?> get props => [serial];
}

class VolunteerSerialNumberChanged extends RegVolunteerEvent {
  final String serialNumber;

  const VolunteerSerialNumberChanged(this.serialNumber);

  @override
  List<Object?> get props => [serialNumber];
}

class VolunteerGiveAddressChanged extends RegVolunteerEvent {
  final String giveAddress;

  const VolunteerGiveAddressChanged(this.giveAddress);

  @override
  List<Object?> get props => [giveAddress];
}

class VolunteerGiveDateSelected extends RegVolunteerEvent {
  final DateTime giveDate;

  const VolunteerGiveDateSelected(this.giveDate);

  @override
  List<Object?> get props => [giveDate];
}

class VolunteerPassImgUploaded extends RegVolunteerEvent {
  @override
  List<Object?> get props => [];
}

class VolunteerPassImgDeleted extends RegVolunteerEvent {
  @override
  List<Object?> get props => [];
}

class VolunteerPageImgUploaded extends RegVolunteerEvent {
  @override
  List<Object?> get props => [];
}

class VolunteerPageImgDeleted extends RegVolunteerEvent {
  final XFile? file;

  const VolunteerPageImgDeleted(this.file);

  @override
  List<Object?> get props => [file];
}

class VolunteerSendBtn extends RegVolunteerEvent {
  @override
  List<Object?> get props => [];
}
