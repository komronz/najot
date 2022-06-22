part of 'saved_page_cubit.dart';

class SavedPageState extends Equatable {
  final List<CardModel> crowdFoundingSavedList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  const SavedPageState({
    this.crowdFoundingSavedList = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  SavedPageState copyWith({
    List<CardModel>? crowdFoundingSavedList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return SavedPageState(
      crowdFoundingSavedList:
          crowdFoundingSavedList ?? this.crowdFoundingSavedList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        crowdFoundingSavedList,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
