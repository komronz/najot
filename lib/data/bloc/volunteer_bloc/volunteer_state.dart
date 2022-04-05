part of 'volunteer_cubit.dart';


class VolunteerState extends Equatable{
  VolunteerState({required this.list});
  List<CardModel> list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];

  VolunteerState copyWith({
    List<CardModel>? list
  }) {
    return VolunteerState(
        list: list ?? this.list

    );
  }

}

