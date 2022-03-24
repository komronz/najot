import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'my_profil_update_bloc.dart';

class MyProfileUpdateState extends Equatable {
  final String name;
  final String sureName;
  final String imageUrl;
  final String phoneNumber;
  final Gender isMan;
  final bool isSavedBtn;
  final bool nameFill;
  final bool sureNameFill;
  final bool phoneNumberFill;
  final bool hasError;
  final bool sendBtnActive;
  final XFile? userImgPath;

  const MyProfileUpdateState({
    this.name = '',
    this.sureName = '',
    this.imageUrl = '',
    this.phoneNumber='',
    this.isMan = Gender.MAN,
    this.isSavedBtn = false,
    this.nameFill = false,
    this.phoneNumberFill=false,
    this.sureNameFill = false,
    this.hasError = false,
    this.userImgPath,
    this.sendBtnActive=false,
  });

  @override
  List<Object?> get props => [
        name,
        sureName,
        imageUrl,
        phoneNumber,
        isMan,
        isSavedBtn,
        nameFill,
        sureNameFill,
        hasError,
        userImgPath,
        phoneNumberFill
      ];

  MyProfileUpdateState copyWith({
    String? name,
    String? sureName,
    String? imageUrl,
    String? phoneNumber,
    bool? phoneNumberFill,
    Gender? isMan,
    bool? isSavedBtn,
    bool? nameFill,
    bool? sureNameFill,
    bool? hasError,
    bool? sendBtnActive,
    XFile? userImgPath,
  }) {
    return MyProfileUpdateState(
      name: name ?? this.name,
      sureName: sureName ?? this.sureName,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberFill: phoneNumberFill ?? this.phoneNumberFill,
      isMan: isMan ?? this.isMan,
      isSavedBtn: isSavedBtn ?? this.isSavedBtn,
      nameFill: nameFill ?? this.nameFill,
      sureNameFill: sureNameFill ?? this.sureNameFill,
      hasError: hasError ?? this.hasError,
      userImgPath: userImgPath ?? this.userImgPath,
    );
  }
}
