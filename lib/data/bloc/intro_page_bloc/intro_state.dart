part of 'intro_cubit.dart';

@immutable
abstract class IntroState extends Equatable{}


class IntroPageNextState extends IntroState{
   int currentIndex;

  IntroPageNextState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];


}
