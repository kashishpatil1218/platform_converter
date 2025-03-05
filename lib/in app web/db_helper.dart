import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  Database? _database;
  String tableName = "web";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initData();
      return _database;
    }
  }

  Future<Database> initData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'web.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, webName TEXT, web TEXT)");
      },
    );
  }

  Future<void> addData(String webName, String web) async {
    Database? db = await database;
    String sql = 'INSERT INTO $tableName(webName, web) VALUES(?,?)';
    List r = [webName, web];
    db!.rawInsert(sql, r);
  }

  Future<List<Map<String, Object?>>> readData() async {
    final db = await database;
    return await db!.query(tableName);
  }

  void delete(int id) async {
    final db = await database;
    await db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
