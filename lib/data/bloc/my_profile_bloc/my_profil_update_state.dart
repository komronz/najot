import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/utils/app_utils.dart';


class MyProfileUpdateState extends Equatable {
  final String name;
  final String sureName;
  final String imageUrl;
  final String phoneNumber;
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


  const MyProfileUpdateState({
    this.name = '',
    this.sureName = '',
    this.imageUrl = '',
    this.phoneNumber='',
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
    this.changePage=1
  });

  @override
  List<Object?> get props => [
        name,
        sureName,
        imageUrl,
        phoneNumber,
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
        changePage

      ];

  MyProfileUpdateState copyWith({
    String? name,
    String? sureName,
    String? imageUrl,
    String? phoneNumber,
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
    File? userImgPath,
    int? changePage
  }) {
    return MyProfileUpdateState(
      name: name ?? this.name,
      sureName: sureName ?? this.sureName,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberFill: phoneNumberFill ?? this.phoneNumberFill,
      gender: gender ?? this.gender,
      status: status?? this.status,
      isSavedBtn: isSavedBtn ?? this.isSavedBtn,
      nameFill: nameFill ?? this.nameFill,
      sureNameFill: sureNameFill ?? this.sureNameFill,
      isVisible: isVisible ?? this.isVisible,
      isVolunteer: isVolunteer ?? this.isVolunteer,
      nextPage: nextPage ?? this.nextPage,
      hasError: hasError ?? this.hasError,
      userImgPath: userImgPath ?? this.userImgPath,
      changePage: changePage ?? this.changePage,

    );
  }
}
