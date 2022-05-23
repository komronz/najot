part of 'volunteer_cubit.dart';

class VolunteerState extends Equatable {
  VolunteerState(
      {this.list = const [],
      this.tobeVolunteer = true,
      this.checkBox = false,
      this.saveHelp = true,
      this.loading = false});

  List<ProjectModel> list;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;
  final loading;

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        tobeVolunteer,
        checkBox,
        saveHelp,
        loading,
      ];

  VolunteerState copyWith({
    List<ProjectModel>? list,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
    bool? loading,
  }) {
    return VolunteerState(
      list: list ?? this.list,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
      loading: loading ?? this.loading,
    );
  }
}
