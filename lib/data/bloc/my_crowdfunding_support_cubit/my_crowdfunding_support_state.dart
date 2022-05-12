import 'package:equatable/equatable.dart';

import '../../model/kraufanding_model.dart';

class MyCrowdfundingSupportState extends Equatable {
  MyCrowdfundingSupportState(
      {required this.cardList,
      required this.isVisible,
      required this.widgetChange});

  final List<KraufandingModel> cardList;
  final bool widgetChange;
  final bool isVisible;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList, isVisible, widgetChange];

  MyCrowdfundingSupportState copyWith({
    List<KraufandingModel>? list,
    bool? widgetChange,
    bool? isVisible,
  }) {
    return MyCrowdfundingSupportState(
      cardList: list ?? this.cardList,
      widgetChange: widgetChange ?? this.widgetChange,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
