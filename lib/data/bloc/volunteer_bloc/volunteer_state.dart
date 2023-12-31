part of 'volunteer_cubit.dart';

class VolunteerState extends Equatable {
  VolunteerState(
      {this.list = const [],
      this.tobeVolunteer = true,
      this.checkBox = false,
      this.saveHelp = true,
      this.searchProjects = const [],
      this.searchProgress = false,
      this.searchChange = "",
      this.internetConnection = true,
      this.reload = false,
      this.loading = false});

  List<ProjectModel> list;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;
  final bool reload;
  final loading;
   List<ProjectModel> searchProjects;
  final bool searchProgress;
  final bool internetConnection;
   String searchChange;

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        tobeVolunteer,
        checkBox,
        saveHelp,
    reload,
        loading,
        searchProgress,
        searchProjects,
        searchChange,
    internetConnection
      ];

  VolunteerState copyWith({
    List<ProjectModel>? list,
    List<ProjectModel>? searchProjects,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
    bool? loading,
    String? searchChange,
    bool? searchProgress,
    bool? reload,
    bool? internetConnection,
  }) {
    return VolunteerState(
      list: list ?? this.list,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
      loading: loading ?? this.loading,
      searchProjects: searchProjects ?? this.searchProjects,
      searchChange: searchChange ?? this.searchChange,
      searchProgress: searchProgress ?? this.searchProgress,
      internetConnection: internetConnection ?? this.internetConnection,
      reload: reload ?? this.reload,
    );
  }
}
