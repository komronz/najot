// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  VolunteerModelDao? _volunteerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `VolunteerDbModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `type` TEXT, `title` TEXT, `helpType` TEXT, `deadLine` TEXT, `content` TEXT, `address` TEXT, `createdAt` TEXT, `modifiedAt` TEXT, `isDone` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  VolunteerModelDao get volunteerDao {
    return _volunteerDaoInstance ??=
        _$VolunteerModelDao(database, changeListener);
  }
}

class _$VolunteerModelDao extends VolunteerModelDao {
  _$VolunteerModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _volunteerDbModelInsertionAdapter = InsertionAdapter(
            database,
            'VolunteerDbModel',
            (VolunteerDbModel item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'title': item.title,
                  'helpType': item.helpType,
                  'deadLine': item.deadLine,
                  'content': item.content,
                  'address': item.address,
                  'createdAt': item.createdAt,
                  'modifiedAt': item.modifiedAt,
                  'isDone': item.isDone ? 1 : 0
                }),
        _volunteerDbModelUpdateAdapter = UpdateAdapter(
            database,
            'VolunteerDbModel',
            ['id'],
            (VolunteerDbModel item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'title': item.title,
                  'helpType': item.helpType,
                  'deadLine': item.deadLine,
                  'content': item.content,
                  'address': item.address,
                  'createdAt': item.createdAt,
                  'modifiedAt': item.modifiedAt,
                  'isDone': item.isDone ? 1 : 0
                }),
        _volunteerDbModelDeletionAdapter = DeletionAdapter(
            database,
            'VolunteerDbModel',
            ['id'],
            (VolunteerDbModel item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'title': item.title,
                  'helpType': item.helpType,
                  'deadLine': item.deadLine,
                  'content': item.content,
                  'address': item.address,
                  'createdAt': item.createdAt,
                  'modifiedAt': item.modifiedAt,
                  'isDone': item.isDone ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<VolunteerDbModel> _volunteerDbModelInsertionAdapter;

  final UpdateAdapter<VolunteerDbModel> _volunteerDbModelUpdateAdapter;

  final DeletionAdapter<VolunteerDbModel> _volunteerDbModelDeletionAdapter;

  @override
  Future<List<VolunteerDbModel>> findAllVolunteerModels() async {
    return _queryAdapter.queryList('SELECT * FROM VolunteerDbModel',
        mapper: (Map<String, Object?> row) => VolunteerDbModel(
            id: row['id'] as int?,
            type: row['type'] as String?,
            title: row['title'] as String?,
            helpType: row['helpType'] as String?,
            deadLine: row['deadLine'] as String?,
            content: row['content'] as String?,
            address: row['address'] as String?,
            createdAt: row['createdAt'] as String?,
            modifiedAt: row['modifiedAt'] as String?,
            isDone: (row['isDone'] as int) != 0));
  }

  @override
  Future<void> updateVolunteerModel(String modifiedAt, int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE VolunteerDbModel SET modifiedAt=?1 WHERE id=?2',
        arguments: [modifiedAt, id]);
  }

  @override
  Future<void> deleteOrderModel(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM VolunteerDbModel WHERE id=?1',
        arguments: [id]);
  }

  @override
  Future<int> insertVolunteerModel(VolunteerDbModel volunteerModel) {
    return _volunteerDbModelInsertionAdapter.insertAndReturnId(
        volunteerModel, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateVolunteer(VolunteerDbModel volunteerModel) {
    return _volunteerDbModelUpdateAdapter.updateAndReturnChangedRows(
        volunteerModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteVolunteerModel(VolunteerDbModel volunteerModel) async {
    await _volunteerDbModelDeletionAdapter.delete(volunteerModel);
  }
}
