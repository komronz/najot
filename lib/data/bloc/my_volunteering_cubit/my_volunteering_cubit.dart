import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';
import 'package:najot/data/services/db_service.dart';
import 'package:najot/data/services/volunteer_donate_service.dart';

part 'my_volunteering_state.dart';

class MyVolunteeringCubit extends Cubit<MyVolunteeringState> {
  static MyVolunteeringCubit get to => GetIt.I<MyVolunteeringCubit>();

  static Future init() async {
    GetIt.instance..registerSingleton<MyVolunteeringCubit>(MyVolunteeringCubit());
  }
  VolunteerDonateService volunteerDonateService=VolunteerDonateService();
  final DBService dbService=DBService();


  MyVolunteeringCubit() : super(MyVolunteeringState());
  List<VolunteerDbModel> volunteerList = [];


  Future load() async {
    var volunteering= await volunteerDonateService.getVolunteerModel();
      var volunteeringType= await volunteerDonateService.getItemVolunteerModel();
    var db=await dbService.getVolunteerList();

    if(volunteering!=null&&volunteeringType!=null){
      for(int i=0; i<volunteering.results!.length; i++){
        for (int j = 0; j < db.length; j++) {
          if(volunteering.results![i].id==db[j].id){
            volunteering.results![i].project!.isDone=true;
          }
      }
    }
      for(int i=0; i<volunteeringType.results!.length; i++){
        for (int j = 0; j < db.length; j++) {
          if(volunteeringType.results![i].id==db[j].id){
            volunteeringType.results![i].project!.isDone=true;
          }
        }
      }
      emit(state.copyWith(cardList: volunteering.results));
      emit(state.copyWith(itemList: volunteeringType.results));
  }
  }
  // Future openFaqItem(int index ) async {
  //   List<VolunteerDonateResults> list=List.from(state.cardList);
  //   list[index].project!.isDone = true;
  //   emit(state.copyWith(cardList: list));
  // }
  //
  // Future openItem(int index) async {
  //   List<VolunteerDonateResults> list=List.from(state.itemList);
  //   list[index].project!.isDone = true;
  //   emit(state.copyWith(cardList: list));
  //   // getFaqList();
  // }

  Future addDbVolunteer(int index, DateTime dateTime)async{
      VolunteerDbModel volunteerDbModel=VolunteerDbModel();
    List<VolunteerDonateResults> list=List.from(state.cardList);
    var box=list[index];
    volunteerDbModel.id=box.id;
    volunteerDbModel.title=box.project!.title;
    volunteerDbModel.helpType=box.project!.helpType;
    volunteerDbModel.address=box.project!.address;
    volunteerDbModel.modifiedAt=dateTime.toString();
    volunteerDbModel.deadLine=box.project!.deadline;
    dbService.saveVolunteer(volunteerDbModel);
    load();
  }
  Future addDbVolunteerItem(int index, DateTime dateTime)async{
    VolunteerDbModel volunteerDbModel=VolunteerDbModel();
    List<VolunteerDonateResults> list=List.from(state.itemList);
    var box=list[index];
    volunteerDbModel.id=box.id;
    volunteerDbModel.title=box.project!.title;
    volunteerDbModel.helpType=box.project!.helpType;
    volunteerDbModel.address=box.project!.address;
    volunteerDbModel.modifiedAt=dateTime.toString();
    volunteerDbModel.deadLine=box.project!.deadline;
    dbService.saveVolunteer(volunteerDbModel);
    load();
  }
  // Future changeVolunteerDate(int index, DateTime time)async{
  //   VolunteerDbModel volunteerDbModel=VolunteerDbModel();
  //   List<VolunteerDonateResults> list=List.from(state.itemList);
  //   var box=list[index];
  //   volunteerDbModel.id=box.id;
  //   box.project!.modifiedAt!=time.toString();
  //   dbService.updateVolunteerModel(volunteerDbModel);
  //   // load();
  // }
}
