part of 'product_cubit.dart';

class ProductState extends Equatable {
  ProductState({
    this.list = const [],
    this.loading = false,
    this.internetConnection =false
  });

  List<Products> list;
  bool loading;
  bool internetConnection;

  @override
  // TODO: implement props
  List<Object?> get props => [list, loading,internetConnection,];

  ProductState copyWith({
    List<Products>? list,
    bool? loading,
    bool? internetConnection
  }) {
    return ProductState(
      list: list ?? this.list,
      loading: loading ?? this.loading,
      internetConnection: internetConnection ?? this.internetConnection,

    );
  }
}
