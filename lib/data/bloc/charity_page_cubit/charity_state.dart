part of 'charity_cubit.dart';

class CharityState extends Equatable {
  CharityState(
      {this.charityModel,
      this.loading = false,
      this.tabLoading = false,
      this.category = const [],
      this.tabProjects,
      this.tobeVolunteer = true,
      this.checkBox = false,
      this.searchProjects = const [],
      this.searchProgress = false,
      this.internetConnection = true,
      this.reload = false,
      this.searchChange = "",
      this.saveHelp = true});

  final RootProjectModel? charityModel;
  final RootProjectModel? tabProjects;
  final bool loading;
  final bool tabLoading;
  final List<TabCategories> category;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;
  List<ProjectModel> searchProjects;
  final bool searchProgress;
  final bool reload;
  final bool internetConnection;
  String searchChange;

  @override
  // TODO: implement props
  List<Object?> get props => [
        tobeVolunteer,
        checkBox,
        saveHelp,
        category,
        tabLoading,
        loading,
        tabProjects,
        charityModel,
        searchProjects,
        searchProjects,
        searchChange,
        reload,
        internetConnection
      ];

  CharityState copyWith({
    RootProjectModel? charityModel,
    RootProjectModel? tabProjects,
    bool? loading,
    bool? tabLoading,
    List<TabCategories>? category,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
    List<ProjectModel>? searchProjects,
    String? searchChange,
    bool? searchProgress,
    bool? internetConnection,
    bool? reload,
  }) {
    return CharityState(
      charityModel: charityModel ?? this.charityModel,
      tabProjects: tabProjects ?? this.tabProjects,
      loading: loading ?? this.loading,
      tabLoading: tabLoading ?? this.tabLoading,
      category: category ?? this.category,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
      searchProjects: searchProjects ?? this.searchProjects,
      searchChange: searchChange ?? this.searchChange,
      searchProgress: searchProgress ?? this.searchProgress,
      internetConnection: internetConnection ?? this.internetConnection,
      reload: reload ?? this.reload,
    );
  }
}
