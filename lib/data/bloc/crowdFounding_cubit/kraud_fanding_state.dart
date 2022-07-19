 part of 'kraud_fanding_cubit.dart';

class CrowdfundingState extends Equatable {
  CrowdfundingState(
      {this.crowdfundingModel=const [],
      this.loading = false,
      this.tabLoading = false,
      this.internetConnection = false,
      this.category = const [],
      this.tabProjects=const [],
      this.searchProjects=const [],
        this.searchProgress=false,
        this.searchChange="",
        this.tabChange=0});

  final List<ProjectModel> crowdfundingModel;
  final List<ProjectModel> tabProjects;
   List<ProjectModel> searchProjects;
  final bool searchProgress;
  final bool loading;
  final bool tabLoading;
   bool internetConnection;
  final int tabChange;
  final String searchChange;
  final List<TabCategories> category;

  @override
  // TODO: implement props
  List<Object?> get props => [
        crowdfundingModel,
        loading,
        category,
        tabProjects,
        tabLoading,
    searchProjects,
    searchProgress,
    searchChange,
        tabChange,
    internetConnection
      ];

  CrowdfundingState copyWith({
    List<ProjectModel>? crowdfundingModel,
    List<ProjectModel>? tabProjects,
    List<ProjectModel>? searchProjects,
      bool? loading,
      bool? tabLoading,
      bool? searchProgress,
      bool? internetConnection,
        int? tabChange,
    String? searchChange,
      List<TabCategories>? category}) {
    return CrowdfundingState(
      crowdfundingModel: crowdfundingModel ?? this.crowdfundingModel,
      tabProjects: tabProjects ?? this.tabProjects,
      loading: loading ?? this.loading,
      tabLoading: tabLoading ?? this.tabLoading,
      category: category ?? this.category,
      internetConnection: internetConnection ?? this.internetConnection,
      tabChange: tabChange ?? this.tabChange,
      searchProjects: searchProjects ?? this.searchProjects,
      searchChange: searchChange ?? this.searchChange,
      searchProgress: searchProgress ?? this.searchProgress,
    );
  }
}
