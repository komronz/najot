part of 'my_volunteering_cubit.dart';

class MyVolunteeringState extends Equatable {
  MyVolunteeringState({this.cardList = const [], this.itemList = const [
  ], this.isDone = false, this.isDoneItem = false});

  final List<VolunteerDonateResults> cardList;
  final List<VolunteerDonateResults> itemList;
  final bool isDone;
  final bool isDoneItem;

  @override
  List<Object?> get props => [cardList, itemList, isDone,isDoneItem];


  MyVolunteeringState copyWith({
    List<VolunteerDonateResults>? cardList,
    List<VolunteerDonateResults>? itemList,
    bool? isDone,
    bool? isDoneItem
  }) {
    return MyVolunteeringState(
        cardList: cardList ?? this.cardList,
        itemList: itemList ?? this.itemList,
        isDone: isDone ?? this.isDone,
        isDoneItem: isDoneItem ?? this.isDoneItem

    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MyVolunteeringState &&
              runtimeType == other.runtimeType &&
              cardList == other.cardList &&
              itemList == other.itemList &&
              isDone == other.isDone&&
              isDoneItem==other.isDoneItem;
}

