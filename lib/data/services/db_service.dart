// 📦 Package imports:
// 🌎 Project imports:
import 'package:get_it/get_it.dart';
import 'package:najot/data/db/database.dart';
import 'package:najot/data/model/volunteer_db_model.dart';

class DBService {
  static AppDatabase? _appDatabase;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<DBService>(DBService());
    await getIt<DBService>().create();
  }

  Future create() async {
    if (_appDatabase == null) {
      _appDatabase =
          await $FloorAppDatabase.databaseBuilder('najot.db').build();
    }
  }

  // volunteer
  Future<List<VolunteerDbModel>> getVolunteerList() async {
    return await _appDatabase!.volunteerDao.findAllVolunteerModels();
  }

  Future<int> saveVolunteer(VolunteerDbModel volunteerDbModel) async {
    return await _appDatabase!.volunteerDao
        .insertVolunteerModel(volunteerDbModel);
  }

  Future<void> deleteVolunteerByName(VolunteerDbModel volunteerDbModel) async {
    return await _appDatabase!.volunteerDao
        .deleteOrderModel(volunteerDbModel.id!);
  }

  Future<void> updateVolunteerModel(VolunteerDbModel productModel) async {
    return await _appDatabase!.volunteerDao
        .updateVolunteerModel(productModel.modifiedAt!, productModel.id!);
  }

  Future<void> deleteVolunteerModel(VolunteerDbModel volunteerModel) async {
    return await _appDatabase!.volunteerDao
        .deleteVolunteerModel(volunteerModel);
  }

  Future<void> deleteVolunteerModelId(VolunteerDbModel volunteerModel) async {
    return await _appDatabase!.volunteerDao
        .deleteOrderModel(volunteerModel.id!);
  }
  Future<void> updateVolunteer(VolunteerDbModel volunteerModel) async {
    return await _appDatabase!.volunteerDao
        .updateVolunteerModel(volunteerModel.modifiedAt!, volunteerModel.id!);
  }
}
