import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    var dbPath = await getDatabasesPath();
    var path = join(await getDatabasesPath(), 'my_local.db');

    try {
      await Directory(dbPath).create(recursive: true);
    } catch (_) {}

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT,
  password TEXT
)
''');
    await db.execute('''
CREATE TABLE riwayat_uang (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tanggal TEXT,
  jenis TEXT,
  nominal INT,
  keterangan TEXT
)
''');
  }
}
