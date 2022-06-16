import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());
  ProductService productService= ProductService();


   Future load() async{
     emit(state.copyWith(loading: true));
     var product= await productService.getProductsModel();
     print(product!.results!.length);

     Future.delayed(Duration(seconds: 2));
     emit(state.copyWith(list: product.results));
     emit(state.copyWith(loading: false));

   }
}
