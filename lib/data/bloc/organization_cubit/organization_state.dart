part of 'organization_cubit.dart';

class OrganizationState extends Equatable {
  final List<OrganizationModelResults> list;
  final RootProjectModel? project;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;
  final bool internetConnection;

  OrganizationState(
      {required this.checkBox,
      this.list = const [],
      this.project,
      this.internetConnection = true,
      this.tobeVolunteer = true,
      this.saveHelp = true});

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        tobeVolunteer,
        project,
        checkBox,
        saveHelp,
    internetConnection
      ];

  OrganizationState copyWith({
    List<OrganizationModelResults>? list,
    RootProjectModel? project,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
    bool? internetConnection
  }) {
    return OrganizationState(
      list: list ?? this.list,
      project: project ?? this.project,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
      internetConnection: internetConnection ?? this.internetConnection,
    );
  }
}
