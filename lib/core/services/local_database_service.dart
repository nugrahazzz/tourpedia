import 'package:flutter/cupertino.dart';
import 'package:vaultify/vaultify.dart';

class LocalDatabaseService {
  static LocalDatabaseService? _instance;
  static Vaultify? _dbInstance;

  LocalDatabaseService._internal();

  factory LocalDatabaseService() {
    _instance ??= LocalDatabaseService._internal();
    return _instance!;
  }

  Future<Vaultify> _initDb() async {
    if (_dbInstance == null) {
      // Jika _dbInstance belum diinisialisasi, maka inisialisasi GetStorage
      await Vaultify.init();
      _dbInstance = Vaultify();
      debugPrint("Initialize Database");
    }
    return _dbInstance!;
  }

  Future<void> write(String key, dynamic data) async {
    final db = await _initDb();
    await db.write(key, data);
  }

  Future<dynamic> read(String key) async {
    final db = await _initDb();
    return db.read(key);
  }

  Future<dynamic> writeIfNull(String key, var value) async {
    final db = await _initDb();
    return db.writeIfNull(key, value);
  }

  Future<void> remove(String key) async {
    final db = await _initDb();
    await db.remove(key);
  }
}
