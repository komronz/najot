import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/charity_saved_service.dart';

part 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(CharityState());



  Future Load()async{

    try{
      var list= await CharitySavedService().getCharityList();
      emit(state.copyWith(list: list));

    }catch(e){

      
    }

  }
}
