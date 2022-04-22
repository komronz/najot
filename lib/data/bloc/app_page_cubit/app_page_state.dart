part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;
  final int changeMenu;
  final bool tobeVolunteer;

  const AppPageState({
    required this.pageType,
    required this.changeMenu,
    required this.tobeVolunteer,
  });

  AppPageState copyWith({
    AppPageType? pageType,
    int? changeMenu,
    bool? tobeVolunteer,
  }) {
    return AppPageState(
      pageType: pageType ?? this.pageType,
      changeMenu: changeMenu ?? this.changeMenu,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
    );
  }

  @override
  List<Object?> get props => [pageType, changeMenu,tobeVolunteer];
}

enum AppPageType {
  MAIN,
  CHARITY,
  ORDERS,
  RULES,
  ORGANIZATIONS,
  FAQ,
  ABOUT,
  PROFILE,
  VOLUNTEER,
  OPERATOR,
  SAVED,
  PROJECT,
  VOLUNTEERING
}
