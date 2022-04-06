part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final List<KraufandingModel> list;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  OrdersState({
    this.list = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  OrdersState copyWith({
    List<KraufandingModel>? list,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return OrdersState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      hasConnection: hasConnection ?? this.hasConnection,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [
        list,
        hasError,
        hasConnection,
        isLoading,
      ];
}