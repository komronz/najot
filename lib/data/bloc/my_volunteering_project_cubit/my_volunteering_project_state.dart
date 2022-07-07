part of 'my_volunteering_project_cubit.dart';

class MyVolunteeringProjectState extends Equatable {
  const MyVolunteeringProjectState(
      {required this.cardList, required this.widgetChange});

  final List<VolunteeringModel> cardList;
  final bool widgetChange;

  @override
  List<Object?> get props => [cardList, widgetChange];

  MyVolunteeringProjectState copyWith({
    List<VolunteeringModel>? list,
    bool? widgetChange,
  }) {
    return MyVolunteeringProjectState(
      cardList: list ?? cardList,
      widgetChange: widgetChange ?? this.widgetChange,
    );
  }
}
