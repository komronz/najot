
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IntroState extends Equatable{}


class IntroPageNextState extends IntroState{
   int currentIndex;

  IntroPageNextState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];


}
