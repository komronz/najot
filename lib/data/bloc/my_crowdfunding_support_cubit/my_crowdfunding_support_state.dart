import 'package:equatable/equatable.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/model/question_model.dart';
import '../../model/kraufanding_model.dart';

class MyCrowdfundingSupportState extends Equatable {
  MyCrowdfundingSupportState({
    required this.cardList,
    required this.isVisible,
    required this.widgetChange,
     this.newsData=const [],
     this.questionData= const [],
  });

  final List<KraufandingModel> cardList;
  final bool widgetChange;
  final bool isVisible;
  final List<NewsData> newsData;
  final List<QuestionsData> questionData;

  @override
  // TODO: implement props
  List<Object?> get props => [
        cardList,
        isVisible,
        widgetChange,
        newsData,
    questionData
      ];

  MyCrowdfundingSupportState copyWith({
    List<KraufandingModel>? list,
    bool? widgetChange,
    bool? isVisible,
    List<NewsData>? newsData,
    List<QuestionsData>? questionData,
  }) {
    return MyCrowdfundingSupportState(
      cardList: list ?? this.cardList,
      widgetChange: widgetChange ?? this.widgetChange,
      isVisible: isVisible ?? this.isVisible,
      newsData: newsData ?? this.newsData,
      questionData: questionData ?? this.questionData,
    );
  }
}
