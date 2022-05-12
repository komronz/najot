part of 'my_volunteering_project_cubit.dart';

class MyVolunteeringProjectState extends Equatable {
  MyVolunteeringProjectState(
      {required this.cardList, required this.widgetChange});

  final List<VolunteeringModel> cardList;
  final bool widgetChange;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList, widgetChange];

  MyVolunteeringProjectState copyWith({
    List<VolunteeringModel>? list,
    bool? widgetChange,
  }) {
    return MyVolunteeringProjectState(
      cardList: list ?? this.cardList,
      widgetChange: widgetChange ?? this.widgetChange,
    );
  }
}
