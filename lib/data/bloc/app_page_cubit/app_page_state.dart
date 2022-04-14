part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;
  final int changeMenu;

  const AppPageState({required this.pageType,required this.changeMenu});

  AppPageState copyWith({AppPageType? pageType,int? changeMenu}) {
    return AppPageState(
      pageType: pageType ?? this.pageType,
      changeMenu: changeMenu ?? this.changeMenu,
    );
  }

  @override
  List<Object?> get props => [pageType,changeMenu];
}

enum AppPageType {
  MAIN,
  CHARITY,
  ORDERS,
  RULES,
  FAQ,
  ABOUT,
  PROFILE,
  VOLUNTEER,
  OPERATOR,
  SAVED,
  PROJECT
}
