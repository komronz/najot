import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState());


  Future loadProducts() async{

      try{
        var products= await ProductsService().getProducts();

        emit(state.copyWith(list: products));

      }catch (e){

      }

  }

}
