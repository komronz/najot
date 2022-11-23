part of 'project_data_cubit.dart';

class ProjectDataState extends Equatable {
  ProjectDataState(
      {this.newsData = const [],
      this.questionsData = const [],
      this.commentsData = const [],
      this.errorQuestion = false,
        this.internetConnection=true
      });

  final List<NewsData> newsData;
  final List<QuestionsData> questionsData;
  final List<CommentsData> commentsData;
  final bool errorQuestion;
  final bool internetConnection;


  @override
  // TODO: implement props
  List<Object?> get props => [
        newsData,
        questionsData,
        commentsData,
        errorQuestion,
        internetConnection
      ];

  ProjectDataState copyWith({
    List<NewsData>? newsData,
    List<QuestionsData>? questionsData,
    List<CommentsData>? commentsData,
    bool? errorQuestion,
    bool? internetConnection,
  }) {
    return ProjectDataState(
      newsData: newsData ?? this.newsData,
      questionsData: questionsData ?? this.questionsData,
      commentsData: commentsData ?? this.commentsData,
      errorQuestion: errorQuestion ?? this.errorQuestion,
      internetConnection: internetConnection ?? this.internetConnection,

    );
  }
}
