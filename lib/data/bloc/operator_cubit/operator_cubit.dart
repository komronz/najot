import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:najot/data/model/operator_model.dart';
import 'package:najot/data/model/sms_model.dart';
import 'package:najot/data/services/operator_service.dart';

part 'operator_state.dart';

class OperatorCubit extends Cubit<OperatorState> {
  final TextEditingController textController;
  final ScrollController controller;
  final OperatorService operatorService=OperatorService();

  OperatorCubit()
      : textController = TextEditingController(),
        controller = ScrollController(),
        super(OperatorState());

  Future load() async {
    var sms = await operatorService.getModel();
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(Duration(seconds: 3));
      emit(state.copyWith(list: sms!.results!, isLoading: false));
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }

  Future sendSms(String content) async {
    var operatorModel=await operatorService.postModel(content);
    if(operatorModel!=null){
      print("Posted");
    }
    // List<OperatorModelResults> list = List.from(state.list!);
    // list.add(
    //   OperatorModelResults(
    //     content: textController.text,
    //     // dateTime: DateTime.now(),
    //   ),
    // );
    textController.clear();
    // emit(state.copyWith(
    //   list: list,
    // ));
    controller.jumpTo(controller.position.maxScrollExtent + 100);
  }

  Future writeSms(String v) async {
    emit(state.copyWith(sendSmsTxt: v));
  }

  Future deleteSmsList() async {
    emit(state.copyWith(list: []));
  }
}
