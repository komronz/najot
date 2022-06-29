import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/services/volunteer_donate_service.dart';

part 'my_volunteering_state.dart';

class MyVolunteeringCubit extends Cubit<MyVolunteeringState> {
  static MyVolunteeringCubit get to => GetIt.I<MyVolunteeringCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<MyVolunteeringCubit>(MyVolunteeringCubit());
  }
  VolunteerDonateService volunteerDonateService=VolunteerDonateService();

  MyVolunteeringCubit() : super(MyVolunteeringState());

  Future load() async {
    var volunteering= await volunteerDonateService.getVolunteerModel();
    var volunteeringType= await volunteerDonateService.getItemVolunteerModel();
    if(volunteering!=null&&volunteeringType!=null){
      emit(state.copyWith(cardList: volunteering.results));
      emit(state.copyWith(itemList: volunteeringType.results));
    }
  }
  Future openFaqItem(int index) async {
    List<VolunteerDonateResults> list=List.from(state.cardList);
    list[index].project!.isDone = true;
    emit(state.copyWith(cardList: list));
    // getFaqList();
  }
  Future openItem(int index) async {
    List<VolunteerDonateResults> list=List.from(state.itemList);
    list[index].project!.isDone = true;
    emit(state.copyWith(cardList: list));
    // getFaqList();
  }
}
