import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() :super(MyProfileState(isVisibled: true));
    bool isVisibled=true;
  void changePageNext(bool isShowed)=> emit(MyProfileState(isVisibled: !isShowed));

}
