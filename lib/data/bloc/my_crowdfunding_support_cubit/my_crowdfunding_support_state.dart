import 'package:equatable/equatable.dart';

import '../../model/crowd_founding_model.dart';

class MyCrowdfundingSupportState extends Equatable {
  const MyCrowdfundingSupportState(
      {required this.cardList,
      required this.isVisible,
      required this.widgetChange});

  final List<CrowdFoundingModel> cardList;
  final bool widgetChange;
  final bool isVisible;

  @override
  List<Object?> get props => [cardList, isVisible, widgetChange];

  MyCrowdfundingSupportState copyWith({
    List<CrowdFoundingModel>? list,
    bool? widgetChange,
    bool? isVisible,
  }) {
    return MyCrowdfundingSupportState(
      cardList: list ?? cardList,
      widgetChange: widgetChange ?? this.widgetChange,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
