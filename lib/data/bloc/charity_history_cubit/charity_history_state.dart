part of 'charity_history_cubit.dart';

class CharityHistoryState extends Equatable {
  final List<CharityModel> charityList;
  final List<CrowdFoundingModel> crowdFoundingList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  const CharityHistoryState({
    this.charityList = const [],
    this.crowdFoundingList = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  CharityHistoryState copyWith({
    List<CharityModel>? charityList,
    List<CrowdFoundingModel>? crowdFoundingList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return CharityHistoryState(
      charityList: charityList ?? this.charityList,
      crowdFoundingList: crowdFoundingList ?? this.crowdFoundingList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        charityList,
        crowdFoundingList,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
