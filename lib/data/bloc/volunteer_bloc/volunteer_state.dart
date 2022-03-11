part of 'volunteer_cubit.dart';

@immutable
abstract class VolunteerState extends Equatable{}

class VolunteerInitial extends VolunteerState {
  VolunteerInitial(this.list);
  List<SliderModel> list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}

