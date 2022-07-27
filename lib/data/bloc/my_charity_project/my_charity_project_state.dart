part of 'my_charity_project_cubit.dart';

class MyProjectAndAnnouncementsPagesState extends Equatable {
  final RootProjectModel? charityList;
  final RootProjectModel? crowdFoundingList;
  final RootProjectModel? volunteeringList;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  MyProjectAndAnnouncementsPagesState({
    this.charityList,
    this.crowdFoundingList,
    this.volunteeringList,
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false
  });

  MyProjectAndAnnouncementsPagesState copyWith({
    RootProjectModel? charityList,
    RootProjectModel? crowdFoundingList,
    RootProjectModel? volunteeringList,
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
  List<Object?> get props => [
    charityList,
    crowdFoundingList,
    volunteeringList,
    hasConnection,
    hasConnection,
    isLoading,
  ];
}
