import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/model/auth_model/login_end_model.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/my_profile_service.dart';
import 'package:najot/data/services/user_update_service.dart';
import 'package:najot/data/utils/app_utils.dart';
import '../../../ui/widgets/app_widgets.dart';
import '../../model/auth_model/user.dart';
import '../../utils/app_logger_util.dart';

part 'my_profil_update_event.dart';

class MyProfileUpdateBloc
    extends Bloc<MyProfileUpdateEvent, MyProfileUpdateState> {
  final PageController pageController;
  final MyProfileService myProfileService = MyProfileService();

  MyProfileUpdateBloc()
      : pageController=PageController(),
        super(MyProfileUpdateState()) {
    on<MyProfileLoad>(_loadProfile);
    on<ImageChanged>(_onImageChanged);
    on<FirstNameChanged>(_onNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<GenderChanged>(_onGenderChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<PageChanged>(_onPageChanged);
    on<PageNext>(_onPageNext);
    on<SendCode>(_sendCode);
    on<EditProfileChangePage>(_onChangeEditProfile);
    on<SaveImagePickers>(_saveImagePickers);

    on<ImagePickers>(_onImagePicker);
    on<SaveIn>(_saveIn);
  }

  Future _onChangeEditProfile(EditProfileChangePage event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(state.copyWith(changePage: event.changePage));
  }

  Future _saveImagePickers(SaveImagePickers event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(state.copyWith(userImgPath: event.userImgPath));
  }


  Future _onPageChanged(PageChanged event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        isVisible: event.isVisible,
      ),
    );
  }

  Future _onPageNext(PageNext event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        nextPage: event.isNext,
      ),
    );
  }

  Future _onImagePicker(ImagePickers event,
      Emitter<MyProfileUpdateState> emit,) async {
    File? imagePicker = (await ImagePicker().pickImage(
      source: ImageSource.gallery,
    )) as File?;
    AppWidgets.isLoading(true);
    if (imagePicker != null) {
      emit(state.copyWith(userImgPath: imagePicker));
      AppWidgets.isLoading(false);
    }
  }

  Future _onImageChanged(ImageChanged event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        imageUrl: event.imageUrl,
      ),
    );
  }

  Future _onNameChanged(FirstNameChanged event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        firstName: event.name,
        nameFill: _isNotEmpty(event.name),
      ),
    );
  }

  Future _onPhoneChanged(PhoneChanged event,
      Emitter<MyProfileUpdateState> emit) async {
    emit(state.copyWith(
      phone: event.phoneNumber,
      phoneNumberFill: _isNotEmpty(event.phoneNumber),
    ),
    );
  }

  Future _onGenderChanged(GenderChanged event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        gender: event.gender,
      ),
    );
  }

  Future _onLastNameChanged(LastNameChanged event,
      Emitter<MyProfileUpdateState> emit,) async {
    emit(
      state.copyWith(
        lastName: event.sureName,
        sureNameFill: _isNotEmpty(event.sureName),
      ),
    );
  }

  bool _isNotEmpty(String value) {
    return value
        .trim()
        .isNotEmpty;
  }
  UserUpdateService userUpdateService = UserUpdateService();

  Future _saveIn(SaveIn event,
      Emitter<MyProfileUpdateState> emit,) async {
      var user = await userUpdateService.postModel(
          state.phone,
          state.firstName,
          state.lastName,
          state.gender,
          state.userImgPath!,
          state.status,
          state.isVolunteer,
      );
      if (user!=null) {
      emit(state.copyWith(hasError: false));
      MyProfileLoad();
    } else {
      emit(state.copyWith(hasError: true));
    }
  }

  Future _loadProfile(MyProfileLoad event,
      Emitter<MyProfileUpdateState> emit,) async {
    var user =  await userUpdateService.getUserModel();
    if (user != null) {
      emit(
        state.copyWith(
          imageUrl: user.photo,
          firstName: user.firstName,
          lastName: user.lastName,
          gender: user.gender,
          phone: user.phone,
        ),
      );
    } else {
      AppLoggerUtil.e('User null ');
    }
  }

  Future _changeNumber(
    ChangeNumber event,
    Emitter<MyProfileUpdateState> emit,
  ) async {
    var changeNumber = await userUpdateService.changeNumber(
      state.codeToken,
      event.code,
    );
    if(state.phone==12){
      if(changeNumber !=null){
        add(EditProfileChangePage(1));
        add(MyProfileLoad());
      }else{
        AppWidgets.showText(text: "Xato kod terildi!");
      }
    }else{
      emit(state.copyWith(hasError: true));
    }

  }

  Future _sendCode(
    SendCode event,
    Emitter<MyProfileUpdateState> emit,
  ) async {
    if (state.phone.length == 12) {
      var response = await userUpdateService.postNumber(state.phone);
      if (response != null) {
        emit(state.copyWith(codeToken: response.code));
        emit(state.copyWith(hasError: false, isVisible: true));
        emit(state.copyWith(isVisible: false));
        add(MyProfileLoad());
      }else{
        AppWidgets.showText(text: "Bu raqam registratsiyadan o'tgan");
      }
    } else {
      AppWidgets.showText(text: 'fail');
      emit(state.copyWith(hasError: true));
    }
  }

  Future deletePost(String reason) async {
    var deletePost = await myProfileService.postDeleteBYId(reason);
    if (deletePost != null) {
      print("delete success");
    }
  }
}
