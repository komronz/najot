import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/model/operator_model.dart';
import 'package:najot/data/services/operator_service.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

part 'operator_state.dart';

class OperatorCubit extends Cubit<OperatorState> {
  final TextEditingController textController;
  final ScrollController controller;
  final OperatorService operatorService = OperatorService();

  OperatorCubit()
      : textController = TextEditingController(),
        controller = ScrollController(),
        super(OperatorState());

  Future load() async {
    emit(state.copyWith(isLoading: true, hasError: false));
    var sms = await operatorService.getModel();
    try {
      if (sms != null) {
        emit(state.copyWith(list: sms.results!, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }
  Future listenSms() async{

  }

  Future loads() async {
    var sms = await operatorService.getModel();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      if (sms != null) {
        emit(state.copyWith(list: sms.results!, isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }

  Future sendSms(
    File? file,
    String content,
  ) async {
    var operatorModel = await operatorService.postModel(
      file,
      content,
    );
    if (operatorModel != null) {
      print(operatorModel);
      saveImage(null);
      loads();
      textController.clear();
      controller.jumpTo(controller.position.maxScrollExtent + 100);
    }

  }

  Future writeSms(String v) async {
    emit(state.copyWith(sendSmsTxt: v));
  }

  void saveImage(File? imagePicker) {
    var newState = OperatorState(
      hasError: state.hasError,
      userImgPath: imagePicker,
      list: state.list,
      sendSmsTxt: state.sendSmsTxt,

    );
    emit(newState);
  }

  Future deleteSmsList() async {
    emit(state.copyWith(list: []));
  }
}
