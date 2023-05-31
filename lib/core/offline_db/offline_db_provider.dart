
// ignore_for_file: unnecessary_null_comparison

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDbProvider {
  final String databaseName = "off_site_tb_v2";
  late Database _db;
  // Script for migrations as well as intialization of tables
  final List<String> initialQuery = [
    "CREATE TABLE IF NOT EXISTS patient (id TEXT PRIMARY KEY, name TEXT,analysis_data TEXT,signature TEXT)",
    "CREATE TABLE IF NOT EXISTS doctor (id TEXT PRIMARY KEY, name TEXT, password TEXT ,isLogin INTEGER)",
  ];

  final List<String> migrationQuery = [];

  Future<Database> get db async {
  _db = await init();
    onCreate(_db, migrationQuery.length + 1);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    return await openDatabase(
      path,
      version: migrationQuery.length + 1,
      onUpgrade: onUpgrade,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    for (String query in initialQuery) {
      await db.execute(query);
    }
  }

  onUpgrade(Database db, int oldVersion, int version) async {
    for (String query in migrationQuery) {
      await db.execute(query);
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
