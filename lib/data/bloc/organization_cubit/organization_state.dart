part of 'organization_cubit.dart';

class OrganizationState extends Equatable {
  final List<OrganizationModelResults> list;
  final RootProjectModel? project;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;
  final bool hasError;
  final bool hasConnection;
  final bool hasLoading;

  OrganizationState(
      {required this.checkBox,
      this.list = const [],
      this.project,
      this.tobeVolunteer = true,
      this.hasError = false,
      this.hasConnection = true,
      this.hasLoading = false,
      this.saveHelp = true});

  OrganizationState copyWith({
    List<OrganizationModelResults>? list,
    RootProjectModel? project,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
    bool? hasError,
    bool? hasConnection,
    bool? hasLoading,
  }) {
    return OrganizationState(
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
      project: project ?? this.project,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      hasError: hasError ?? this.hasError,
      hasLoading: hasLoading ?? this.hasLoading,
      hasConnection: hasConnection ?? this.hasConnection,
      list: list ?? this.list,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        tobeVolunteer,
        project,
        checkBox,
        saveHelp,
        hasError,
        hasConnection,
        hasLoading,
      ];
}
