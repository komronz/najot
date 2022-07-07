import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:najot/data/model/sms_model.dart';
import 'package:najot/data/services/sms_service.dart';

part 'operator_state.dart';

class OperatorCubit extends Cubit<OperatorState> {
  OperatorCubit()
      : textController = TextEditingController(),
        controller = ScrollController(),
        super(const OperatorState());

  final TextEditingController textController;
  final ScrollController controller;
  var service = SmsService();

  Future load() async {
    try {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));
      await Future.delayed(const Duration(seconds: 3));
      var list = await service.getSmsList();
      emit(state.copyWith(list: list, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
      ));
    }
  }

  Future sendSms(String text) async {
    List<SmsModel> list = List.from(state.list);
    list.add(
      SmsModel(
        type: SmsType.user,
        text: textController.text,
        dateTime: DateTime.now(),
      ),
    );
    textController.clear();
    emit(state.copyWith(
      list: list,
    ));
    controller.jumpTo(controller.position.maxScrollExtent + 100);
  }

  Future writeSms(String v) async {
    emit(state.copyWith(sendSmsTxt: v));
  }

  Future deleteSmsList() async {
    emit(state.copyWith(list: []));
  }
}
