part of 'my_volunteering_project_cubit.dart';

@immutable
class MyVolunteeringProjectState extends Equatable{
  MyVolunteeringProjectState({required this.cardList});

  final List<VolunteeringModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];


  MyVolunteeringProjectState copyWith({
    List<VolunteeringModel>? list

  }) {
    return MyVolunteeringProjectState(cardList: list ?? this.cardList);
  }
}
