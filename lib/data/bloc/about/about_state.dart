part of 'about_cubit.dart';


class AboutState extends Equatable {
  final List<AboutModel> list;
  final bool hasError;
  final bool hasConnection;
  final bool hasLoading;

  AboutState({
    this.list = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.hasLoading = false,
  });

  AboutState copyWith({
    List<AboutModel>? list,
    bool? hasError,
    bool? hasConnection,
    bool? hasLoading,
  }) {
    return AboutState(
      hasError: hasError ?? this.hasError,
      hasLoading: hasLoading ?? this.hasLoading,
      hasConnection: hasConnection ?? this.hasConnection,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [
    list,
    hasError,
    hasConnection,
    hasLoading,
  ];
}