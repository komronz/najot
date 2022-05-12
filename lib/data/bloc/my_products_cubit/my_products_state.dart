import 'package:equatable/equatable.dart';
import 'package:najot/data/model/product_model.dart';

class MyProductsState extends Equatable {
  final List<ProductModel> list;
  final bool hasError;
  final bool hasConnection;
  final bool isLoading;

  MyProductsState({
    this.list = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
  });

  MyProductsState copyWith({
    List<ProductModel>? list,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
  }) {
    return MyProductsState(
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
