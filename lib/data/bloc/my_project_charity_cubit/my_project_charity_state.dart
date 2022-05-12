part of 'my_project_charity_cubit.dart';

@immutable
class MyProjectCharityState extends Equatable {
  MyProjectCharityState(this.tabChange);

  final int tabChange;

  @override
  // TODO: implement props
  List<Object?> get props => [tabChange];

  MyProjectCharityState copyWith({int? tabChange}) {
    return MyProjectCharityState(tabChange ?? this.tabChange);
  }
}
