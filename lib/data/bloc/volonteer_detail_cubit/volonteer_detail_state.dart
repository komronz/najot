part of 'volonteer_detail_cubit.dart';

class VolunteerDetailState extends Equatable {
  VolunteerDetailState(
      {
      required this.checkBox,
        this.tobeVolunteer = true,
      this.saveHelp = true,});

  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

  @override
  // TODO: implement props
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
