import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/product_service.dart';

import '../../services/main_service.dart';
import '../crowdFounding_cubit/kraud_fanding_cubit.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());
  ProductService productService= ProductService();
  var internetConnection;


   Future load() async{
     internetConnection = await MainService().checkInternetConnection();
     if(internetConnection){
       emit(state.copyWith(loading: true));
       var product= await productService.getProductsModel();
       if(product != null){
         emit(state.copyWith(list: product.results));
         emit(state.copyWith(loading: false));
       }else{
         emit(state.copyWith(loading: false));
       }
     }else{
       CrowdfundingCubit.to.load();
     }



   }
}
