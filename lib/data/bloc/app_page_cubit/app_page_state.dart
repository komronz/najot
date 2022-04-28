part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;
  final int changeMenu;
  final bool tobeVolunteer;

  const AppPageState({
     this.pageType=AppPageType.MAIN,
     this.changeMenu=1,
     this.tobeVolunteer=false,
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
  USERPROFILE,
  VOLUNTEER,
  OPERATOR,
  SAVED,
  PROJECT,
  VOLUNTEERING,
  ADD_PROJECT,
  ORDERS_VOLUNTEER,
  CHARITY_VOLUNTEER,
  DEFAULT,

}
