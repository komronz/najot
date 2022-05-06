part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({
    this.categories = const [],
    this.crudFunding = const [],
    this.volunteer = const [],
    this.charity = const [],
    this.slider = const [],
  });

  final List<Categories> categories;
  final List<ProjectModel> crudFunding;
  final List<ProjectModel> volunteer;
  final List<ProjectModel> charity;
  final List<SliderList> slider;

  @override
  // TODO: implement props
  List<Object?> get props => [categories];

  HomeState copyWith({
    List<Categories>? categories,
     List<ProjectModel>? crudFunding,
     List<ProjectModel>? volunteer,
     List<ProjectModel>? charity,
     List<SliderList>? slider,

  }) {
    return HomeState(
      categories: categories ?? this.categories,
      crudFunding: crudFunding ?? this.crudFunding,
      volunteer: volunteer ?? this.volunteer,
      charity: charity ?? this.charity,
      slider: slider ?? this.slider,
    );
  }
}
