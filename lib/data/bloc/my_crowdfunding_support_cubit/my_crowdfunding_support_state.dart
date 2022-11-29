import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:najot/data/model/comments_model.dart';
import 'package:najot/data/model/news_model.dart';
import 'package:najot/data/model/question_model.dart';

class MyCrowdfundingSupportState extends Equatable {
  MyCrowdfundingSupportState({
    required this.isVisible,
    required this.widgetChange,
    required this.questionData,
    this.newsData = const [],
    this.commentsData = const [],
    this.file,
  });

  final bool widgetChange;
  final bool isVisible;
  File? file;
  final List<NewsData> newsData;
  final List<QuestionsData> questionData;
  final List<CommentsData> commentsData;

  @override
  List<Object?> get props =>
      [isVisible, widgetChange, newsData, file, questionData, commentsData];

  MyCrowdfundingSupportState copyWith(
      {bool? widgetChange,
      bool? isVisible,
      List<NewsData>? newsData,
      List<QuestionsData>? questionData,
      List<CommentsData>? commentsData,
      File? file}) {
    return MyCrowdfundingSupportState(
      widgetChange: widgetChange ?? this.widgetChange,
      isVisible: isVisible ?? this.isVisible,
      newsData: newsData ?? this.newsData,
      questionData: questionData ?? this.questionData,
      file: file ?? this.file,
      commentsData: commentsData ?? this.commentsData,
    );
  }
}
