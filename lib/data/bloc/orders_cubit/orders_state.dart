
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/oreder_model.dart';

class OrdersState extends Equatable {
  final List<OrderModelResults> list;
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
    List<OrderModelResults>? list,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
    bool? isClick,

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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrdersState &&
              runtimeType == other.runtimeType &&
              hasError == other.hasError &&
              list == other.list &&
              hasConnection == other.hasConnection &&
              isLoading == other.isLoading;
}
