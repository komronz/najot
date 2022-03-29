part of 'saved_page_cubit.dart';

@immutable
class SavedPageState extends Equatable{
  final List<CharityModelSaved> charitySavedList;
  final List<CardModel> kraufandingSavedList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  SavedPageState({
    this.charitySavedList = const [],
    this.kraufandingSavedList = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  SavedPageState copyWith({
    List<CharityModelSaved>? charitySavedList,
    List<CardModel>? kraufandingSavedList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return SavedPageState(
      charitySavedList: charitySavedList ?? this.charitySavedList,
      kraufandingSavedList: kraufandingSavedList ?? this.kraufandingSavedList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    charitySavedList,
    kraufandingSavedList,
    hasConnection,
    hasConnection,
    isLoading,
  ];

}


