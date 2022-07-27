part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;
  final int changeMenu;
  final bool tobeVolunteer;
    User? user;

   AppPageState(
      {this.pageType = AppPageType.MAIN,
      this.changeMenu = 1,
      this.tobeVolunteer = false,
      this.user});

  AppPageState copyWith({
    AppPageType? pageType,
    int? changeMenu,
    bool? tobeVolunteer,
    User? user,
  }) {
    return AppPageState(
      pageType: pageType ?? this.pageType,
      changeMenu: changeMenu ?? this.changeMenu,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        pageType,
        changeMenu,
        tobeVolunteer,
        user,
      ];
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
  USER_UPDATE,
  NUMBER,
  NOTIFICATION,
  DEFAULT,
}
