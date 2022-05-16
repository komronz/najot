part of 'faq_cubit.dart';

class FaqState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final bool hasConnection;
  final List<FaqModel> list;

  const FaqState({
    this.hasLoading = false,
    this.hasError = false,
    this.hasConnection = true,
    this.list = const [],
  });

  FaqState copyWith({
    bool? hasLoading,
    bool? hasError,
    bool? hasConnection,
    List<FaqModel>? list,
  }) {
    return FaqState(
      hasError: hasError ?? this.hasError,
      list: list ?? this.list,
      hasConnection: hasConnection ?? this.hasConnection,
      hasLoading: hasLoading ?? this.hasLoading,
     );
  }

  @override
  List<Object?> get props => [hasLoading, hasError, hasConnection, list];
}
