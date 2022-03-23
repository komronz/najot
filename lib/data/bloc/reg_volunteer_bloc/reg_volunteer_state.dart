part of 'reg_volunteer_bloc.dart';

class RegVolunteerState extends Equatable {
  final String firstName;
  final String lastName;
  final String address;
  final Gender gender;
  final DateTime? birthDate;
  final bool isActiveNextBtn;
  final String serial;
  final String serialNumber;
  final String givenAddress;
  final DateTime? givenDate;
  final XFile? passportImgPath;
  final XFile? pageImgPath;
  final bool sendBtnActive;
  final bool waitVolunteer;

  RegVolunteerState({
    this.firstName = '',
    this.lastName = '',
    this.address = '',
    this.gender = Gender.MAN,
    this.birthDate,
    this.isActiveNextBtn = false,
    this.serial = '',
    this.serialNumber = '',
    this.givenAddress = '',
    this.givenDate,
    this.passportImgPath,
    this.pageImgPath,
    this.sendBtnActive = false,
    this.waitVolunteer = false,
  });

  RegVolunteerState copyWith({
    String? firstName,
    String? lastName,
    String? address,
    Gender? gender,
    DateTime? birthDate,
    bool? isActiveNextBtn,
    String? serial,
    String? serialNumber,
    String? givenAddress,
    DateTime? givenDate,
    XFile? passportImgPath,
    XFile? pageImgPath,
    bool? sendBtnActive,
    bool? waitVolunteer,
  }) {
    return RegVolunteerState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      givenAddress: givenAddress ?? this.givenAddress,
      givenDate: givenDate ?? this.givenDate,
      isActiveNextBtn: isActiveNextBtn ?? this.isActiveNextBtn,
      pageImgPath: pageImgPath ?? this.pageImgPath,
      passportImgPath: passportImgPath ?? this.passportImgPath,
      serial: serial ?? this.serial,
      serialNumber: serialNumber ?? this.serialNumber,
      sendBtnActive: sendBtnActive ?? this.sendBtnActive,
      waitVolunteer: waitVolunteer ?? this.waitVolunteer,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        address,
        gender,
        birthDate,
        isActiveNextBtn,
        serial,
        serialNumber,
        givenAddress,
        givenDate,
        pageImgPath,
        passportImgPath,
        waitVolunteer,
      ];
}

enum Gender { MAN, WOMAN }
