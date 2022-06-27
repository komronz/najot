 part of 'kraud_fanding_cubit.dart';

class CrowdfundingState extends Equatable {
  CrowdfundingState(
      {this.crowdfundingModel,
      this.loading = false,
      this.tabLoading = false,
      this.category = const [],
      this.tabProjects,
        this.tabChange=0});

  final RootProjectModel? crowdfundingModel;
  final RootProjectModel? tabProjects;
  final bool loading;
  final bool tabLoading;
  final int tabChange;
  final List<TabCategories> category;

  @override
  // TODO: implement props
  List<Object?> get props => [
        crowdfundingModel,
        loading,
        category,
        tabProjects,
        tabLoading,
        tabChange
      ];

  CrowdfundingState copyWith({RootProjectModel? crowdfundingModel,
      RootProjectModel? tabProjects,
      bool? loading,
      bool? tabLoading,
        int? tabChange,
      List<TabCategories>? category}) {
    return CrowdfundingState(
      crowdfundingModel: crowdfundingModel ?? this.crowdfundingModel,
      tabProjects: tabProjects ?? this.tabProjects,
      loading: loading ?? this.loading,
      tabLoading: tabLoading ?? this.tabLoading,
      category: category ?? this.category,
      tabChange: tabChange ?? this.tabChange,
    );
  }
}
