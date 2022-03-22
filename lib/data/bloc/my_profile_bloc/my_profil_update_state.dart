
import 'package:equatable/equatable.dart';

import 'my_profil_update_bloc.dart';

class MyProfileUpdateState extends Equatable {
  final String name;
  final String sureName;
  final String imageUrl;
  final Gender isMan;
  final bool isSavedBtn;
  final bool nameFill;
  final bool sureNameFill;
  final bool hasError;

  const MyProfileUpdateState({
    this.name = '',
    this.sureName = '',
    this.imageUrl='',
    this.isMan = Gender.MAN,
    this.isSavedBtn = false,
    this.nameFill=false,
    this.sureNameFill=false,
    this.hasError=false
  });

  @override
  List<Object?> get props => [
        name,
        sureName,
        imageUrl,
        isMan,
        isSavedBtn,
        nameFill,
        sureNameFill,
        hasError,
      ];

  MyProfileUpdateState copyWith({
    String? name,
    String? sureName,
    String? imageUrl,
    Gender? isMan,
    bool? isSavedBtn,
    bool? nameFill,
    bool? sureNameFill,
    bool? hasError,
  }) {
    return MyProfileUpdateState(
      name: name ?? this.name,
      sureName: sureName ?? this.sureName,
      imageUrl: imageUrl ?? this.imageUrl,
      isMan: isMan ?? this.isMan,
      isSavedBtn: isSavedBtn ?? this.isSavedBtn,
      nameFill: nameFill ?? this.nameFill,
      sureNameFill: sureNameFill ?? this.sureNameFill,
      hasError: hasError ?? this.hasError,
    );
  }
}
