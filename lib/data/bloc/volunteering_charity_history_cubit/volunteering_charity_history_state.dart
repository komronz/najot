part of 'volunteering_charity_history_cubit.dart';

class VolunteeringCharityHistoryState extends Equatable {
  final List<CharityModel> charityList;
  final List<KraufandingModel> kraufandingList;
  final List<CharityModel> itemsCharity;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  VolunteeringCharityHistoryState({
    this.charityList = const [],
    this.kraufandingList = const [],
    this.itemsCharity = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  VolunteeringCharityHistoryState copyWith({
    List<CharityModel>? charityList,
    List<KraufandingModel>? kraufandingList,
    List<CharityModel>? itemsCharity,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return VolunteeringCharityHistoryState(
      charityList: charityList ?? this.charityList,
      kraufandingList: kraufandingList ?? this.kraufandingList,
      itemsCharity: itemsCharity ?? this.itemsCharity,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    charityList,
    kraufandingList,
    itemsCharity,
    hasConnection,
    hasConnection,
    isLoading,
  ];
}
