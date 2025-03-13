import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  DataBaseHelper.internal();
  Future<Database> initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, 'movies.db');
    var urDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return urDb;
  }

  void _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
      ''' CREATE TABLE users( id INTEGER PRIMARY KEY,firstName TEXT ,lastName TEXT ,email TEXT , password TEXT ,confirmPassword text ) ''',
    );
    batch.execute('''
    CREATE TABLE favourites (
    id INTEGER PRIMARY KEY ,
    image TEXT,
    title TEXT,
    rating TEXT,
    year TEXT,
    sorting TEXT,
    isFavourite TEXT ,
    email TEXT 
    )
    ''');
    batch.commit();
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}
  Future<void> insert({
    required String table,
    required Map<String, Object?> values,
  }) async {
    final db = await DataBaseHelper().db;
    await db!.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'movies.db');
    await deleteDatabase(path);
  }
}
