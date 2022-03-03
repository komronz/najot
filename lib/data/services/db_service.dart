// 📦 Package imports:
// 🌎 Project imports:
import 'package:najot/data/db/database.dart';
import 'package:najot/data/model/task_model.dart';
import 'package:get_it/get_it.dart';

class DBService {
  static AppDatabase? _appDatabase;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<DBService>(DBService());
    await getIt<DBService>().create();
  }

  Future create() async {
    if (_appDatabase == null) {
      // _appDatabase = await $FloorAppDatabase.databaseBuilder('najot.db').build();
    }
  }
}
