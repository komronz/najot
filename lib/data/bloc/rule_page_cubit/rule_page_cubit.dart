import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/bloc/rule_page_cubit/rule_page_state.dart';
import 'package:najot/data/services/rule_service.dart';
class RulePageCubit extends Cubit<RulePageState> {
  static RulePageCubit get to => GetIt.I<RulePageCubit>();
  RulePageCubit() : super(RulePageState());
  RuleService ruleService = RuleService();

  static Future init() async {
    GetIt.instance..registerSingleton<RulePageCubit>(RulePageCubit());
  }

  Future getFaqList() async {
    var mainFaqModel = await ruleService.getRulePageModel();
      emit(state.copyWith(hasLoading: true, hasError: false,),);
    if(mainFaqModel!=null){
      emit(state.copyWith(hasLoading: false, list: mainFaqModel.ruleModel));
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,),);
    }
  }

}
