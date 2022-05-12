part of 'my_charity_project_cubit.dart';

class MyProjectAndAnnouncementsPagesState extends Equatable {
  final List<CharityModel> charityList;
  final List<CrowdFoundingModel> crowdFoundingList;
  final List<VolunteeringModel> volunteeringList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  MyProjectAndAnnouncementsPagesState(
      {this.charityList = const [],
      this.crowdFoundingList = const [],
      this.volunteeringList = const [],
      this.hasError = false,
      this.hasConnection = true,
      this.isLoading = false,});

  MyProjectAndAnnouncementsPagesState copyWith({
    List<CharityModel>? charityList,
    List<CrowdFoundingModel>? crowdFoundingList,
    List<VolunteeringModel>? volunteeringList,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return MyProjectAndAnnouncementsPagesState(
      charityList: charityList ?? this.charityList,
      crowdFoundingList: crowdFoundingList ?? this.crowdFoundingList,
      volunteeringList: volunteeringList ?? this.volunteeringList,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        charityList,
        crowdFoundingList,
        volunteeringList,
        hasConnection,
        hasConnection,
        isLoading,
      ];
}
