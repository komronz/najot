import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/bloc/rule_page_cubit/rule_page_state.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/rule_service.dart';
class RulePageCubit extends Cubit<RulePageState> {
  static RulePageCubit get to => GetIt.I<RulePageCubit>();
  RulePageCubit() : super(RulePageState());
  RuleService ruleService = RuleService();
  var internetConnection;

  static Future init() async {
    GetIt.instance..registerSingleton<RulePageCubit>(RulePageCubit());
  }

  Future getFaqList() async {
    internetConnection = await MainService().checkInternetConnection();
    emit(state.copyWith(internetConnection: internetConnection));
    emit(state.copyWith(hasLoading: true, hasError: false,),);
    var mainFaqModel = await ruleService.getRulePageModel();
    if(mainFaqModel!=null){
      emit(state.copyWith(hasLoading: false, list: mainFaqModel.ruleModel));
    }else{
      emit(state.copyWith(hasLoading: false, hasError: true,),);
    }
  }

}
