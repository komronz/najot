import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';

import '../../../ui/widgets/app_widgets.dart';
import '../../model/user.dart';
import '../../services/navigator_service.dart';
import '../../utils/app_logger_util.dart';

part 'my_profil_update_event.dart';

class MyProfileUpdateBloc extends Bloc<MyProfileUpdateEvent, MyProfileUpdateState> {
  MyProfileUpdateBloc() : super(MyProfileUpdateState()) {
    on<MyProfileLoad>(_loadProfile);
    on<ImageChanged>(_onImageChanged);
    on<FirstNameChanged>(_onNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<GenderChanged>(_onGenderChanged);
    on<ImagePickers>(_onImagePicker);
    on<SaveIn>(_saveIn);
  }
  Future _onImagePicker(
      ImagePickers event,
      Emitter<MyProfileUpdateState> emit,
      ) async{
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    AppWidgets.isLoading(true);
    if (imagePicker != null) {
      emit(state.copyWith(userImgPath: imagePicker));
      AppWidgets.isLoading(false);
    }
  }

  Future _onImageChanged(
      ImageChanged event,
      Emitter<MyProfileUpdateState> emit,
      ) async {
    emit(
      state.copyWith(
        name: event.imageUrl,
      ),
    );
  }
  Future _onNameChanged(
      FirstNameChanged event,
      Emitter<MyProfileUpdateState> emit,
      ) async {
    emit(
      state.copyWith(
        name: event.name,
        nameFill: _isNotEmpty(event.name),

      ),
    );
  }

  Future _onGenderChanged(
      GenderChanged event,
      Emitter<MyProfileUpdateState> emit,
      ) async {
    emit(
      state.copyWith(
        isMan: event.isMan,
      ),
    );
  }

  Future _onLastNameChanged(
      LastNameChanged event,
      Emitter<MyProfileUpdateState> emit,
      ) async {
    emit(
      state.copyWith(
        sureName: event.sureName,
        sureNameFill: _isNotEmpty(event.sureName),
      ),
    );
  }

  bool _isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  Future _saveIn(
      SaveIn event,
      Emitter<MyProfileUpdateState> emit,
      ) async {

    if (_isNotEmpty(state.name) && _isNotEmpty(state.sureName)) {
      var user = User(
        imageUrl: state.imageUrl,
        firstName: state.name,
        lastName: state.sureName,
        isMan: state.isMan,
      );
      HiveService.to.setUser(user);
      AppWidgets.showText(text: 'Success');
      emit(state.copyWith(hasError: false));
      AppLoggerUtil.i(user.toJson().toString());
    } else {
      emit(state.copyWith(hasError: true));
    }
  }

  Future _loadProfile(
    MyProfileLoad event,
    Emitter<MyProfileUpdateState> emit,
  ) async {
    var user = HiveService.to.getUser();
    if (user != null) {
      emit(
        state.copyWith(
          imageUrl: user.imageUrl,
          name: user.firstName,
          sureName: user.lastName,
          isMan: user.isMan,
        ),
      );
    } else {
      AppLoggerUtil.e('User null ');
    }
  }
}
