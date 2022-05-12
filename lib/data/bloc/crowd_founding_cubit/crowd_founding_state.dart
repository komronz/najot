part of 'crowd_founding_cubit.dart';

class CrowdFoundingState extends Equatable {
  CrowdFoundingState({required this.cardList});

  final List<CardModel> cardList;

  @override
  List<Object?> get props => [cardList];

  CrowdFoundingState copyWith({List<CardModel>? list}) {
    return CrowdFoundingState(cardList: list ?? this.cardList);
  }
}
