part of 'edit_volunteer_bloc.dart';



class EditVolunteerState extends Equatable {
  final String name;
  final String sureName;
  final String imageUrl;
  final String phoneNumber;
  final Gender isMan;
  final bool isSavedBtn;
  final bool nameFill;
  final bool sureNameFill;
  final bool phoneNumberFill;
  final bool isVisible;
  final bool hasError;
  final bool nextPage;
  final XFile? userImgPath;
  final int changePage;

  const EditVolunteerState({
    this.name = '',
    this.sureName = '',
    this.imageUrl = '',
    this.phoneNumber='',
    this.isMan = Gender.MAN,
    this.isSavedBtn = false,
    this.nameFill = false,
    this.phoneNumberFill=false,
    this.sureNameFill = false,
    this.isVisible=true,
    this.nextPage=false,
    this.hasError = false,
    this.userImgPath,
    this.changePage=1
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
    phoneNumberFill,
    nextPage,
    isVisible,
    changePage
  ];

  EditVolunteerState copyWith({
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
    bool? isVisible,
    bool? nextPage,
    XFile? userImgPath,
    int? changePage
  }) {
    return EditVolunteerState(
      name: name ?? this.name,
      sureName: sureName ?? this.sureName,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberFill: phoneNumberFill ?? this.phoneNumberFill,
      isMan: isMan ?? this.isMan,
      isSavedBtn: isSavedBtn ?? this.isSavedBtn,
      nameFill: nameFill ?? this.nameFill,
      sureNameFill: sureNameFill ?? this.sureNameFill,
      isVisible: isVisible ?? this.isVisible,
      nextPage: nextPage ?? this.nextPage,
      hasError: hasError ?? this.hasError,
      userImgPath: userImgPath ?? this.userImgPath,
      changePage: changePage ?? this.changePage,
    );
  }
}