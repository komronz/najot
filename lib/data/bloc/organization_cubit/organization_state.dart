part of 'organization_cubit.dart';

class OrganizationState extends Equatable {
  final List<OrganizationModelResults> list;
  final List<ProjectsModelResults> listProject;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

  OrganizationState(
      {required this.checkBox,
      this.list = const [],
      this.listProject = const [],
      this.tobeVolunteer = true,
      this.saveHelp = true});

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        tobeVolunteer,
        listProject,
        checkBox,
        saveHelp,
      ];

  OrganizationState copyWith({
    List<OrganizationModelResults>? list,
    List<ProjectsModelResults>? listProject,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
  }) {
    return OrganizationState(
      list: list ?? this.list,
      listProject: listProject ?? this.listProject,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
    );
  }
}
