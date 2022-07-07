part of 'volunteer_detail_cubit.dart';

class VolunteerDetailState extends Equatable {
  const VolunteerDetailState({
    required this.checkBox,
    this.tobeVolunteer = true,
    this.saveHelp = true,
  });

  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

  @override
  List<Object?> get props => [tobeVolunteer, checkBox, saveHelp];

  VolunteerDetailState copyWith({
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
  }) {
    return VolunteerDetailState(
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
    );
  }
}
