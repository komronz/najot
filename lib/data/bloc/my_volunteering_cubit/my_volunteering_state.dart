part of 'my_volunteering_cubit.dart';

class MyVolunteeringState extends Equatable {
  const MyVolunteeringState({required this.cardList});

  final List<VolunteeringModel> cardList;

  @override
  List<Object?> get props => [cardList];

  MyVolunteeringState copyWith({List<VolunteeringModel>? list}) {
    return MyVolunteeringState(cardList: list ?? cardList);
  }
}
