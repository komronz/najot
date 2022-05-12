part of 'charity_history_cubit.dart';

class CharityHistoryState extends Equatable {
  final List<CharityModel> charityList;
  final List<CrowdFoundingModel> kraufandingList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  CharityHistoryState({
    this.charityList = const [],
    this.kraufandingList = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  CharityHistoryState copyWith({
    List<CharityModel>? charityList,
    List<CrowdFoundingModel>? kraufandingList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return CharityHistoryState(
      charityList: charityList ?? this.charityList,
      kraufandingList: kraufandingList ?? this.kraufandingList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        charityList,
        kraufandingList,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
