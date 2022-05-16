part of 'faq_cubit.dart';

class FaqState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final bool hasConnection;
  final List<FaqModel> list;
  final bool isOpened;

  const FaqState({
    this.hasLoading = false,
    this.hasError = false,
    this.hasConnection = true,
    this.list = const [],
    this.isOpened=false,
  });

  FaqState copyWith({
    bool? hasLoading,
    bool? hasError,
    bool? hasConnection,
    List<FaqModel>? list,
    bool? isOpened=false,
  }) {
    return FaqState(
      hasError: hasError ?? this.hasError,
      list: list ?? this.list,
      hasConnection: hasConnection ?? this.hasConnection,
      hasLoading: hasLoading ?? this.hasLoading,
      isOpened: isOpened ?? this.isOpened,

    );
  }

  @override
  List<Object?> get props => [hasLoading, hasError, hasConnection,isOpened, list];
}
