part of 'my_volunteering_cubit.dart';

class MyVolunteeringState extends Equatable {
  MyVolunteeringState({required this.cardList});

  final List<VolunteeringModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];

  MyVolunteeringState copyWith({List<VolunteeringModel>? list}) {
    return MyVolunteeringState(cardList: list ?? this.cardList);
  }
}
