part of 'my_profile_cubit.dart';

@immutable
abstract class MyProfileState extends Equatable {}


class ChangeState extends MyProfileState{
  final bool isSelected;

  ChangeState({required this.isSelected});

  List<Object?> get props => [isSelected];

}