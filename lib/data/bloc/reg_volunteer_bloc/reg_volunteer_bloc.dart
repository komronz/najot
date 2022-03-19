import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'reg_volunteer_event.dart';

part 'reg_volunteer_state.dart';

class RegVolunteerBloc extends Bloc<RegVolunteerEvent, RegVolunteerState> {
  final PageController pageController;

  RegVolunteerBloc()
      : pageController = PageController(),
        super(RegVolunteerState()) {
    on<VolunteerFirstNameChanged>(_onFirstNameChanged);
    on<VolunteerLastNameChanged>(_onLastNameChanged);
    on<VolunteerAddressChanged>(_onAddressChanged);
    on<VolunteerBirthDateSelected>(_onBirthDateSelected);
    on<VolunteerGenderChanged>(_onGenderChanged);
    on<VolunteerSerialChanged>(_onSerialChanged);
  }

  Future _onFirstNameChanged(
    VolunteerFirstNameChanged event,
    Emitter<RegVolunteerState> emit,
  ) async {
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

  bool _isNextButtonActive(
    String firstName,
    String lastName,
    String address,
    DateTime? dateTime,
  ) {
    if (_isNotEmpty(firstName) &&
        _isNotEmpty(lastName) &&
        _isNotEmpty(address) &&
        dateTime != null) {
      return true;
    }
    return false;
  }

  bool _isNotEmpty(String v) {
    return v.isNotEmpty;
  }

  Future _onLastNameChanged(
    VolunteerLastNameChanged event,
    Emitter<RegVolunteerState> emit,
  ) async {
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

  Future _onAddressChanged(
    VolunteerAddressChanged event,
    Emitter<RegVolunteerState> emit,
  ) async {
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

  Future _onBirthDateSelected(
    VolunteerBirthDateSelected event,
    Emitter<RegVolunteerState> emit,
  ) async {
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

  Future _onGenderChanged(
    VolunteerGenderChanged event,
    Emitter<RegVolunteerState> emit,
  ) async {
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

  Future _onSerialChanged(
    VolunteerSerialChanged event,
    Emitter<RegVolunteerState> emit,
  ) async {
    emit(
      state.copyWith(
        serial: event.serial,
        sendBtnActive: _sendBtnActive(
          event.serial,
          state.serialNumber,
          state.givenAddress,
          state.givenDate,
        ),
      ),
    );
  }

  bool _sendBtnActive(
    String serial,
    String serialNum,
    String giveAdd,
    DateTime? giveDate,
  ) {
    if (_isNotEmpty(serial) &&
        _isNotEmpty(serialNum) &&
        _isNotEmpty(giveAdd) &&
        giveDate != null) {
      return true;
    }
    return false;
  }
}
