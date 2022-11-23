part of 'favorite_add_cubit.dart';

class FavoriteAddState extends Equatable {
  final List<ProjectModel> list;
  final bool hasError;
  final bool hasConnection;
  final bool hasLoading;

  FavoriteAddState({
    this.list = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.hasLoading = false,
  });

  FavoriteAddState copyWith({
    List<ProjectModel>? list,
    bool? hasError,
    bool? hasConnection,
    bool? hasLoading,
  }) {
    return FavoriteAddState(
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
