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

  StepsDao? _stepsDaoInstance;

  CaloriesDao? _caloriesDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Steps` (`id` INTEGER, `value` REAL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Calories` (`id` INTEGER, `value` REAL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StepsDao get stepsDao {
    return _stepsDaoInstance ??= _$StepsDao(database, changeListener);
  }

  @override
  CaloriesDao get caloriesDao {
    return _caloriesDaoInstance ??= _$CaloriesDao(database, changeListener);
  }
}

class _$StepsDao extends StepsDao {
  _$StepsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _stepsInsertionAdapter = InsertionAdapter(
            database,
            'Steps',
            (Steps item) =>
                <String, Object?>{'id': item.id, 'value': item.value});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Steps> _stepsInsertionAdapter;

  @override
  Future<List<Steps>> findAllSteps() async {
    return _queryAdapter.queryList('SELECT * FROM Steps',
        mapper: (Map<String, Object?> row) =>
            Steps(row['id'] as int?, row['value'] as double?));
  }

  @override
  Future<Steps?> findStepsById(int id) async {
    return _queryAdapter.query('SELECT * FROM Steps WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Steps(row['id'] as int?, row['value'] as double?),
        arguments: [id]);
  }

  @override
  Future<void> insertSteps(Steps steps) async {
    await _stepsInsertionAdapter.insert(steps, OnConflictStrategy.abort);
  }
}

class _$CaloriesDao extends CaloriesDao {
  _$CaloriesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _caloriesInsertionAdapter = InsertionAdapter(
            database,
            'Calories',
            (Calories item) =>
                <String, Object?>{'id': item.id, 'value': item.value});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Calories> _caloriesInsertionAdapter;

  @override
  Future<List<Calories>> findAllCalories() async {
    return _queryAdapter.queryList('SELECT * FROM Calories',
        mapper: (Map<String, Object?> row) =>
            Calories(row['id'] as int?, row['value'] as double?));
  }

  @override
  Future<Calories?> findCaloriesById(int id) async {
    return _queryAdapter.query('SELECT * FROM Calories WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Calories(row['id'] as int?, row['value'] as double?),
        arguments: [id]);
  }

  @override
  Future<void> insertCalories(Calories calories) async {
    await _caloriesInsertionAdapter.insert(calories, OnConflictStrategy.abort);
  }
}
