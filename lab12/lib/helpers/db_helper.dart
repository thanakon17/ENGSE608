import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'home_pharma_v2.db'), // เปลี่ยนชื่อไฟล์ DB เพื่อเริ่มใหม่
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE inventory(id TEXT PRIMARY KEY, name TEXT, type TEXT, amount INTEGER, date TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  // ฟังก์ชันลบข้อมูล
  static Future<void> delete(String table, String id) async {
    final db = await DBHelper.database();
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}