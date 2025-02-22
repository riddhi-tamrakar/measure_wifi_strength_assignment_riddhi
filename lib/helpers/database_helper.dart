import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "wifi_data_2.db";
  static const _databaseVersion = 1;
  static const table = 'wifi_data';
  static const columnId = 'id';
  static const columnTimestamp = 'timestamp';
  static const columnSignal = 'signal_strength';
  static const columnLatitude = 'latitude';
  static const columnLongitude = 'longitude';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTimestamp TEXT NOT NULL,
        $columnSignal INTEGER NOT NULL,
        $columnLatitude REAL NOT NULL,
        $columnLongitude REAL NOT NULL
      )
    ''');
  }

  Future<int> insertData(
      int signalStrength, double latitude, double longitude) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnTimestamp: DateTime.now().toIso8601String(),
      columnSignal: signalStrength,
      columnLatitude: latitude,
      columnLongitude: longitude,
    };
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    Database db = await database;
    return await db.query(table);
  }
}
