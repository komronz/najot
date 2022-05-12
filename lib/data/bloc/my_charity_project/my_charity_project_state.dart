part of 'my_charity_project_cubit.dart';

class MyProjectAndAnnouncementsPagesState extends Equatable {
  final List<CharityModel> charityList;
  final List<KraufandingModel> kraufandingList;
  final List<VolunteeringModel> volunteeringList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  MyProjectAndAnnouncementsPagesState(
      {this.charityList = const [],
      this.kraufandingList = const [],
      this.volunteeringList = const [],
      this.hasError = false,
      this.hasConnection = true,
      this.isLoading = false});

  MyProjectAndAnnouncementsPagesState copyWith({
    List<CharityModel>? charityList,
    List<KraufandingModel>? kraufandingList,
    List<VolunteeringModel>? volunteeringList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return MyProjectAndAnnouncementsPagesState(
      charityList: charityList ?? this.charityList,
      kraufandingList: kraufandingList ?? this.kraufandingList,
      volunteeringList: volunteeringList ?? this.volunteeringList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        charityList,
        kraufandingList,
        volunteeringList,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
