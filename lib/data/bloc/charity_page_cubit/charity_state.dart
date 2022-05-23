part of 'charity_cubit.dart';

class CharityState extends Equatable {
  CharityState(
      {this.charityModel,
      this.loading = false,
      this.tabLoading = false,
      this.category = const [],
      this.tabProjects,
      this.tobeVolunteer = true,
       this.checkBox=false,
      this.saveHelp = true});

  final RootProjectModel? charityModel;
  final RootProjectModel? tabProjects;
  final bool loading;
  final bool tabLoading;
  final List<TabCategories> category;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

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
    );
  }
}
