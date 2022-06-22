import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  PageController pageController;

  IntroCubit()
      : pageController = PageController(initialPage: 0),
        super(IntroPageNextState(currentIndex: 0));

  int currentIndex = 0;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void changePageNext(int page) {
    currentIndex = page;
    emit(IntroPageNextState(currentIndex: page));
  }
}
