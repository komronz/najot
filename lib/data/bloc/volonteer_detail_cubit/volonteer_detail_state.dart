part of 'volonteer_detail_cubit.dart';

class VolunteerDetailState extends Equatable {
  VolunteerDetailState({
    this.tobeVolunteer = true,
    required this.checkBox,
  });

  final bool tobeVolunteer;
  final bool checkBox;

  @override
  // TODO: implement props
  List<Object?> get props => [tobeVolunteer, checkBox];

  VolunteerDetailState copyWith({
    bool? tobeVolunteer,
    bool? checkBox,
  }) {
    return VolunteerDetailState(
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
    );
  }
}
