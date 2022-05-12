import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:najot/data/model/volunteering_model.dart';

import '../../model/charity_model.dart';
import '../../model/crowd_founding_model.dart';

part 'my_charity_project_state.dart';

class MyProjectAndAnnouncementsPagesCubit
    extends Cubit<MyProjectAndAnnouncementsPagesState> {
  static MyProjectAndAnnouncementsPagesCubit get to =>
      GetIt.I<MyProjectAndAnnouncementsPagesCubit>();

  static Future init() async {
    GetIt.I
      ..registerSingleton<MyProjectAndAnnouncementsPagesCubit>(
          MyProjectAndAnnouncementsPagesCubit());
  }

  MyProjectAndAnnouncementsPagesCubit()
      : super(MyProjectAndAnnouncementsPagesState(
            volunteeringList: VolunteeringModel.list,
            charityList: CharityModel.list,
            crowdFoundingList: CrowdFoundingModel.list));
}
