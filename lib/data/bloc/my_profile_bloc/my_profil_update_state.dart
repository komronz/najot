import 'dart:io';
import 'package:equatable/equatable.dart';
class MyProfileUpdateState extends Equatable {
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String phone;
  final String newPhone;
  final String? gender;
  final String status;
  final bool isVolunteer;
  final bool isSavedBtn;
  final bool nameFill;
  final bool sureNameFill;
  final bool phoneNumberFill;
  final bool isVisible;
  final bool hasError;
  final bool nextPage;
  final File? userImgPath;
  final int changePage;
  final String codeToken;
  final bool internetConnection;


  const MyProfileUpdateState({
    this.firstName = '',
    this.lastName = '',
    this.imageUrl = '',
    this.phone='',
    this.newPhone='',
    this.gender,
    this.status = "",
    this.isSavedBtn = false,
    this.nameFill = false,
    this.phoneNumberFill=false,
    this.sureNameFill = false,
    this.isVisible=true,
    this.nextPage=false,
    this.hasError = false,
    this.isVolunteer=false,
    this.userImgPath,
    this.changePage=1,
    this.codeToken="",
    this.internetConnection= true
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        imageUrl,
        phone,
        gender,
        status,
        isSavedBtn,
        nameFill,
        sureNameFill,
        isVolunteer,
        hasError,
        userImgPath,
        phoneNumberFill,
        nextPage,
        isVisible,
        changePage,
    codeToken,
    newPhone,
    internetConnection

      ];

  MyProfileUpdateState copyWith({
    String? firstName,
    String? lastName,
    String? imageUrl,
    String? phone,
    String? newPhone,
    bool? phoneNumberFill,
    String? gender,
    String? status,
    bool? isSavedBtn,
    bool? isVolunteer,
    bool? nameFill,
    bool? sureNameFill,
    bool? hasError,
    bool? sendBtnActive,
    bool? isVisible,
    bool? nextPage,
    bool? internetConnection,
    File? userImgPath,
    int? changePage,
    String? codeToken
  }) {
    return MyProfileUpdateState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      newPhone: newPhone ?? this.newPhone,
      phoneNumberFill: phoneNumberFill ?? this.phoneNumberFill,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      isSavedBtn: isSavedBtn ?? this.isSavedBtn,
      nameFill: nameFill ?? this.nameFill,
      sureNameFill: sureNameFill ?? this.sureNameFill,
      isVisible: isVisible ?? this.isVisible,
      isVolunteer: isVolunteer ?? this.isVolunteer,
      nextPage: nextPage ?? this.nextPage,
      hasError: hasError ?? this.hasError,
      userImgPath: userImgPath ?? this.userImgPath,
      changePage: changePage ?? this.changePage,
      codeToken: codeToken ?? this.codeToken,
      internetConnection: internetConnection ?? this.internetConnection,

    );
  }
}
