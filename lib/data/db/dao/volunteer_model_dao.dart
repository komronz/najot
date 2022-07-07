
import 'package:floor/floor.dart';
import 'package:najot/data/model/volunteer_db_model.dart';
import 'package:najot/data/model/volunteer_donate_model.dart';

@dao
abstract class VolunteerModelDao {
  @insert
  Future<int> insertVolunteerModel(VolunteerDbModel volunteerModel);

  @delete
  Future<void> deleteVolunteerModel(VolunteerDbModel volunteerModel);

  @update
  Future<int> updateVolunteer(VolunteerDbModel volunteerModel);

  @Query("SELECT * FROM VolunteerDbModel")
  Future<List<VolunteerDbModel>> findAllVolunteerModels();

  @Query("UPDATE VolunteerDbModel SET modifiedAt=:modifiedAt WHERE id=:id")
  Future<void> updateVolunteerModel(String modifiedAt, int id);

  @Query("DELETE FROM VolunteerDbModel WHERE id=:id")
  Future<void> deleteOrderModel(int id);
}
