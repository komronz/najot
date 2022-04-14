part of 'my_charity_support_list_cubit.dart';

class MyCharitySupportListState extends Equatable {
  MyCharitySupportListState({required this.cardList});

  final List<CharityModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];


  MyCharitySupportListState copyWith({
    List<CharityModel>? list

  }) {
    return MyCharitySupportListState(cardList: list ?? this.cardList);
  }
}
