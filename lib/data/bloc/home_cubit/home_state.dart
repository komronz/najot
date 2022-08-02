part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({
    this.categories = const [],
    this.crudFunding = const [],
    this.volunteer = const [],
    this.charity = const [],
    this.slider = const [],
    this.internetConnection=true,
    this.progress=false,
    this.reload=false
  });

  final List<Categories> categories;
        List<ProjectModel> crudFunding;
  final List<ProjectModel> volunteer;
  final List<ProjectModel> charity;
  final List<SliderList> slider;
  final bool internetConnection;
  final bool progress;
  final bool reload;

  @override
  // TODO: implement props
  List<Object?> get props => [
        categories,
        crudFunding,
        volunteer,
        charity,
        slider,
        internetConnection,
    progress,
    reload
      ];

  HomeState copyWith({
    List<Categories>? categories,
    List<ProjectModel>? crudFunding,
    List<ProjectModel>? volunteer,
    List<ProjectModel>? charity,
    List<SliderList>? slider,
    bool? internetConnection,
    bool? progress,
    bool? reload,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      crudFunding: crudFunding ?? this.crudFunding,
      volunteer: volunteer ?? this.volunteer,
      charity: charity ?? this.charity,
      slider: slider ?? this.slider,
      internetConnection: internetConnection ?? this.internetConnection,
      progress: progress ?? this.progress,
      reload: reload ?? this.reload,
    );
  }
}
