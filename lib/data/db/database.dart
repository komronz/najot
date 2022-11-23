import 'dart:async';

import 'package:floor/floor.dart';
import 'package:najot/data/db/dao/volunteer_model_dao.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [VolunteerDbModel])
abstract class AppDatabase extends FloorDatabase {
  VolunteerModelDao get volunteerDao;

}
