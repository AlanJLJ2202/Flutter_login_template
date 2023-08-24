import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import '../models/user.dart';


class SQLiteProvider {
  createDatabase(Database db , int version) async{
    await db.execute(
        "CREATE TABLE user("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "email TEXT,"
        "balance TEXT,"
        "remember_token TEXT)");
  }

  initDatabase() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "t_app.db");
    return await openDatabase(path, version: 1, onCreate: createDatabase);
  }

  closeDatabase(Database db) async{
    await db.close();
  }

  Future<User?> getInternalUser() async {
    Database db = await initDatabase();
    var res = await db.query("user");
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }

  Future<bool> hasInternalToken() async {
    Database db = await initDatabase();
    var res = await db.query("user");
    return res.isNotEmpty;
  }

  Future<void> deleteInternalUser() async {
    Database db = await initDatabase();
    await db.delete("user");
  }

  Future<void> saveInternalUser(User user) async {
    Database db = await initDatabase();
    await db.delete("user");
    await db.insert("user", user.toJson());
  }

  Future<User?> updateInternalUser(User user) async {
    Database db = await initDatabase();
    await db.update("user", user.toJson(), where: "id = ?", whereArgs: [user.id]);
    var res = await db.query("user");
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }
}
