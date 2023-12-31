import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/services/charity_service.dart';
import 'package:najot/data/services/crowdfunding_service.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/volunteer_project_service.dart';
part 'my_charity_project_state.dart';

class MyProjectAndAnnouncementsPagesCubit extends Cubit<MyProjectAndAnnouncementsPagesState> {
  static MyProjectAndAnnouncementsPagesCubit get to => GetIt.I<MyProjectAndAnnouncementsPagesCubit>();

  static Future init() async {
    GetIt.instance
      ..registerSingleton<MyProjectAndAnnouncementsPagesCubit>(MyProjectAndAnnouncementsPagesCubit());
  }
  CrowdfundingService crowdfundingService = CrowdfundingService();
  VolunteerProjectService volunteerProjectService = VolunteerProjectService();
  CharityService charityService = CharityService();
  MainService mainService = MainService();
  var internetConnection;


  MyProjectAndAnnouncementsPagesCubit() : super(MyProjectAndAnnouncementsPagesState());

  Future load() async{
    internetConnection = await mainService.checkInternetConnection();
    emit(state.copyWith(hasConnection: internetConnection));
    emit(state.copyWith(isLoading: true));
    var crowdfundingModel = await crowdfundingService.getCrowdfundingModel();
    var volunteeringModel = await volunteerProjectService.getVolunteerModel();
    var charityModel = await charityService.getCharityModel();
    if(crowdfundingModel!=null && volunteeringModel!=null && charityModel!=null){
      emit(state.copyWith(crowdFoundingList: crowdfundingModel));
      emit(state.copyWith(volunteeringList: volunteeringModel));
      emit(state.copyWith(charityList: charityModel));
      emit(state.copyWith(isLoading: false));


    }
    emit(state.copyWith(isLoading: false));


  }
}
