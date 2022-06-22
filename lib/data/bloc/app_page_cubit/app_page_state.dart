part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;
  final int changeMenu;
  final bool tobeVolunteer;

  const AppPageState({
    this.pageType = AppPageType.main,
    this.changeMenu = 1,
    this.tobeVolunteer = false,
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
  List<Object?> get props => [pageType, changeMenu, tobeVolunteer];
}

enum AppPageType {
  main,
  charity,
  orders,
  rules,
  organizations,
  faq,
  about,
  profile,
  userprofile,
  volunteer,
  operator,
  saved,
  project,
  volunteering,
  addProject,
  ordersVolunteer,
  charityVolunteer,
  userUpdate,
  number,
  defaultT,
}
