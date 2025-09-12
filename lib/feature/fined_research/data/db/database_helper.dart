import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/case_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("cases.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE cases (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      phone TEXT,
      address TEXT,
      governorate TEXT,
      area TEXT,
      category TEXT,
      criteriaCount INTEGER,
      donationValue REAL,
      hasProject INTEGER,
      status TEXT,
      isActive INTEGER
    )
    ''');
  }

  Future<int> insertCase(CaseModel caseModel) async {
    final db = await instance.database;
    return await db.insert('cases', caseModel.toMap());
  }

  Future<List<CaseModel>> getCases() async {
    final db = await instance.database;
    final result = await db.query('cases');
    return result.map((map) => CaseModel.fromMap(map)).toList();
  }
}
