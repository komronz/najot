part of 'products_cubit.dart';

@immutable
 class ProductsState extends Equatable {
  ProductsState({this.list = const []});
  List<ProductModel> list;
  @override
  // TODO: implement props
  List<Object?> get props => [list];


  ProductsState copyWith({
  List<ProductModel>? list
}){
    return ProductsState( list: list ?? this.list);
}
}


