part of 'volunteering_charity_history_cubit.dart';

class VolunteeringCharityHistoryState extends Equatable {
  final List<CrowdFoundingModel> kraufandingList;
  final List<CharityModel> charityList;
  final List<CharityModel> itemsCharity;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  const VolunteeringCharityHistoryState({
    this.charityList = const [],
    this.kraufandingList = const [],
    this.itemsCharity = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  VolunteeringCharityHistoryState copyWith({
    List<CrowdFoundingModel>? kraufandingList,
    List<CharityModel>? charityList,
    List<CharityModel>? itemsCharity,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return VolunteeringCharityHistoryState(
      kraufandingList: kraufandingList ?? this.kraufandingList,
      charityList: charityList ?? this.charityList,
      itemsCharity: itemsCharity ?? this.itemsCharity,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        kraufandingList,
        charityList,
        itemsCharity,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
