import 'package:floor/floor.dart';
import 'package:najot/data/model/task_model.dart';

// part 'database.g.dart';

@Database(version: 1, entities: [TaskModel])
abstract class AppDatabase extends FloorDatabase {

}
