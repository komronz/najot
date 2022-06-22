part of 'volunteer_cubit.dart';

class VolunteerState extends Equatable {
  const VolunteerState({required this.list});

  final List<CardModel> list;

  @override
  List<Object?> get props => [list];

  VolunteerState copyWith({List<CardModel>? list}) {
    return VolunteerState(list: list ?? this.list);
  }
}
