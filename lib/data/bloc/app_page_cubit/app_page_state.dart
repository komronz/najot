part of 'app_page_cubit.dart';

class AppPageState extends Equatable {
  final AppPageType pageType;

  const AppPageState({required this.pageType});

  AppPageState copyWith({AppPageType? pageType}) {
    return AppPageState(
      pageType: pageType ?? this.pageType,
    );
  }

  @override
  List<Object?> get props => [pageType];
}

enum AppPageType {
  MAIN,
  CHARITY,
  ORDERS,
  RULES,
  FAQ,
  ABOUT,
  PROFILE,
  VOLUNTEER
}
