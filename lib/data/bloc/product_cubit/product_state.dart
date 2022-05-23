part of 'product_cubit.dart';

class ProductState extends Equatable {
  ProductState({
    this.list = const [],
    this.loading = false,
  });

  List<Products> list;
  bool loading;

  @override
  // TODO: implement props
  List<Object?> get props => [list, loading];

  ProductState copyWith({
    List<Products>? list,
    bool? loading
  }) {
    return ProductState(
      list: list ?? this.list,
      loading: loading ?? this.loading,
    );
  }
}
