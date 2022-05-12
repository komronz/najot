part of 'kraud_fanding_cubit.dart';

class KraudFandingState extends Equatable {
  KraudFandingState({required this.cardList});

  final List<CardModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];

  KraudFandingState copyWith({List<CardModel>? list}) {
    return KraudFandingState(cardList: list ?? this.cardList);
  }
}
