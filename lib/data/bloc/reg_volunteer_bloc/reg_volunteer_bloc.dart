import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/services/volunteer_profile_service.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

part 'reg_volunteer_event.dart';

part 'reg_volunteer_state.dart';

class RegVolunteerBloc extends Bloc<RegVolunteerEvent, RegVolunteerState> {
  final PageController pageController;
  final maskFormatterSerial = MaskTextInputFormatter(mask: 'AA');
  final maskFormatterPasNumber = MaskTextInputFormatter(mask: '#######');
  final maskFormatter = MaskTextInputFormatter();
  VolunteerProfileService service = VolunteerProfileService();


  RegVolunteerBloc()
      : pageController = PageController(),
        super(RegVolunteerState()) {
    on<VolunteerFirstNameChanged>(_onFirstNameChanged);
    on<VolunteerLastNameChanged>(_onLastNameChanged);
    on<VolunteerAddressChanged>(_onAddressChanged);
    on<VolunteerBirthDateSelected>(_onBirthDateSelected);
    on<VolunteerGenderChanged>(_onGenderChanged);
    on<VolunteerSerialChanged>(_onSerialChanged);
    on<VolunteerSerialNumberChanged>(_onSerialNumberChanged);
    on<VolunteerGiveAddressChanged>(_onGiveAddressChanged);
    on<VolunteerGiveDateSelected>(_onGiveDateSelected);
    on<VolunteerPageImgUploaded>(_onPageImgUploaded);
    on<VolunteerPassImgUploaded>(_onPassImgUploaded);
    on<VolunteerSendBtn>(_onSendBtnPressed);
    on<VolunteerPageImgDeleted>(_onPageImgDeleted);
    on<VolunteerPassImgDeleted>(_onPassImgDeleted);
    on<PostVolunteerData>(_onPostVolunteerData);
  }

  Future _onPostVolunteerData(PostVolunteerData event,
      Emitter<RegVolunteerState> emit,) async {
    var postVolunteerData =await service.postVolunteerData(
      HiveService.to.getUser()!.firstName!,
      HiveService.to.getUser()!.lastName!,
      state.address,
      "${state.gender}",
      state.birthDate!,
      state.serial,
      state.serialNumber,
      state.givenAddress,
      state.givenDate!,
      state.pageImgPath!,
      state.passportImgPath!,);

    if(postVolunteerData != null){
      print(postVolunteerData);
          emit(state.copyWith(postSuccess: true));
    }
  }

  Future _onFirstNameChanged(VolunteerFirstNameChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        firstName: event.firstName,
        isActiveNextBtn: _isNextButtonActive(
          event.firstName,
          state.lastName,
          state.address,
          state.birthDate,
        ),
      ),
    );
  }

  bool _isNextButtonActive(String firstName,
      String lastName,
      String address,
      DateTime? dateTime,) {
    if (
    _isNotEmpty(address) &&
        dateTime != null) {
      return true;
    }
    return false;
  }

  bool _isNotEmpty(String v) {
    return v.isNotEmpty;
  }

  Future _onLastNameChanged(VolunteerLastNameChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        lastName: event.lastName,
        isActiveNextBtn: _isNextButtonActive(
          state.firstName,
          event.lastName,
          state.address,
          state.birthDate,
        ),
      ),
    );
  }

  Future _onAddressChanged(VolunteerAddressChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        address: event.address,
        isActiveNextBtn: _isNextButtonActive(
          state.firstName,
          state.lastName,
          event.address,
          state.birthDate,
        ),
      ),
    );
  }

  Future _onBirthDateSelected(VolunteerBirthDateSelected event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        birthDate: event.birthDate,
        isActiveNextBtn: _isNextButtonActive(
          state.firstName,
          state.lastName,
          state.address,
          event.birthDate,
        ),
      ),
    );
  }

  Future _onGenderChanged(VolunteerGenderChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(state.copyWith(gender: _gender(event.gender)));
  }

  Gender _gender(int gender) {
    switch (gender) {
      case 1:
        return Gender.MAN;
      case 2:
        return Gender.WOMAN;
      default:
        return Gender.MAN;
    }
  }

  Future _onSerialChanged(VolunteerSerialChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        serial: event.serial,
        inputFormatter: maskFormatterSerial,
        sendBtnActive: _sendBtnActive(
          event.serial,
          state.serialNumber,
          state.givenAddress,
          state.givenDate,
          state.passportImgPath,
          state.pageImgPath,
        ),
      ),
    );
  }

  bool _sendBtnActive(String serial,
      String serialNum,
      String giveAdd,
      DateTime? giveDate,
      XFile? passPage,
      XFile? regPage,) {
    if (_isNotEmpty(serial) &&
        _isNotEmpty(serialNum) &&
        _isNotEmpty(giveAdd) &&
        giveDate != null &&
        passPage != null &&
        regPage != null) {
      return true;
    }
    return false;
  }

  Future _onSerialNumberChanged(VolunteerSerialNumberChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        serialNumber: event.serialNumber,
        inputFormatter: maskFormatterPasNumber,
        sendBtnActive: _sendBtnActive(
          state.serial,
          event.serialNumber,
          state.givenAddress,
          state.givenDate,
          state.passportImgPath,
          state.pageImgPath,
        ),
      ),
    );
  }

  Future _onGiveAddressChanged(VolunteerGiveAddressChanged event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        givenAddress: event.giveAddress,
        sendBtnActive: _sendBtnActive(
          state.serial,
          state.serialNumber,
          event.giveAddress,
          state.givenDate,
          state.passportImgPath,
          state.pageImgPath,
        ),
      ),
    );
  }

  Future _onGiveDateSelected(VolunteerGiveDateSelected event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      state.copyWith(
        givenDate: event.giveDate,
        sendBtnActive: _sendBtnActive(
          state.serial,
          state.serialNumber,
          state.givenAddress,
          event.giveDate,
          state.passportImgPath,
          state.pageImgPath,
        ),
      ),
    );
  }

  Future _onPageImgUploaded(VolunteerPageImgUploaded event,
      Emitter<RegVolunteerState> emit,) async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    AppWidgets.isLoading(true);
    if (imagePicker != null) {
      emit(state.copyWith(
        pageImgPath: imagePicker,
        sendBtnActive: _sendBtnActive(
          state.serial,
          state.serialNumber,
          state.givenAddress,
          state.givenDate,
          state.passportImgPath,
          imagePicker,
        ),
      ));
      AppWidgets.isLoading(false);
    }
  }

  Future _onPassImgUploaded(VolunteerPassImgUploaded event,
      Emitter<RegVolunteerState> emit,) async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    AppWidgets.isLoading(true);
    if (imagePicker != null) {
      emit(
        state.copyWith(
          passportImgPath: imagePicker,
          sendBtnActive: _sendBtnActive(
            state.serial,
            state.serialNumber,
            state.givenAddress,
            state.givenDate,
            imagePicker,
            state.pageImgPath,
          ),
        ),
      );
      AppWidgets.isLoading(false);
    }
  }

  Future _onSendBtnPressed(VolunteerSendBtn event,
      Emitter<RegVolunteerState> emit,) async {
    emit(state.copyWith(waitVolunteer: true));
  }

  Future _onPageImgDeleted(VolunteerPageImgDeleted event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      RegVolunteerState(
        waitVolunteer: state.waitVolunteer,
        address: state.address,
        birthDate: state.birthDate,
        firstName: state.firstName,
        gender: state.gender,
        givenAddress: state.givenAddress,
        givenDate: state.givenDate,
        isActiveNextBtn: state.isActiveNextBtn,
        lastName: state.lastName,
        pageImgPath: null,
        passportImgPath: state.passportImgPath,
        sendBtnActive: state.sendBtnActive,
        serial: state.serial,
        serialNumber: state.serialNumber,
      ),
    );
    AppLoggerUtil.i(state.toString());
  }

  Future _onPassImgDeleted(VolunteerPassImgDeleted event,
      Emitter<RegVolunteerState> emit,) async {
    emit(
      RegVolunteerState(
        waitVolunteer: state.waitVolunteer,
        address: state.address,
        birthDate: state.birthDate,
        firstName: state.firstName,
        gender: state.gender,
        givenAddress: state.givenAddress,
        givenDate: state.givenDate,
        isActiveNextBtn: state.isActiveNextBtn,
        lastName: state.lastName,
        pageImgPath: state.pageImgPath,
        passportImgPath: null,
        sendBtnActive: state.sendBtnActive,
        serial: state.serial,
        serialNumber: state.serialNumber,
      ),
    );
    AppLoggerUtil.i('deled');
  }
}
