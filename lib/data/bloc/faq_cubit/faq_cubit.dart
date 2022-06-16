import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/bloc/faq_cubit/faq_state.dart';
import 'package:najot/data/model/faq_model.dart';
import 'package:najot/data/services/faq_service.dart';
class FaqCubit extends Cubit<FaqState> {
  static FaqCubit get to => GetIt.I<FaqCubit>();
  FaqCubit() : super(FaqState());
  FaqService faqService = FaqService();

  static Future init() async {
    GetIt.instance..registerSingleton<FaqCubit>(FaqCubit());
  }

  Future getFaqList() async {
    var mainFaqModel = await faqService.getModel();
      emit(state.copyWith(hasLoading: true, hasError: false,),);
    if(mainFaqModel!=null){
      emit(state.copyWith(hasLoading: false, list: mainFaqModel.faqModel));
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,),);
    }
  }
  Future openFaqItem(int index) async {
    List<FaqModel> list=List.from(state.list);
    list[index].isOpen = !(list[index].isOpen ?? false);
    emit(state.copyWith(list: list));
    // getFaqList();
  }
}
