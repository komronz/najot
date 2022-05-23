
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/kraufanding_model.dart';
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
