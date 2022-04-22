import 'package:equatable/equatable.dart';

import '../../model/charity_model.dart';

class MyCharitySupportListState extends Equatable {
  MyCharitySupportListState(
      {required this.cardList, required this.widgetChange});

  final List<CharityModel> cardList;
  final bool widgetChange;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList, widgetChange];

  MyCharitySupportListState copyWith({
    List<CharityModel>? list,
    bool? widgetChange,
  }) {
    return MyCharitySupportListState(
      cardList: list ?? this.cardList,
      widgetChange: widgetChange ?? this.widgetChange,
    );
  }
}
