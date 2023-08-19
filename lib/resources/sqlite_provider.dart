import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:io';
import 'package:path/path.dart';


class SQLiteProvider {

  createDatabase(Database db , int version) async{
    await db.execute("CREATE TABLE user(id INTEGER PRIMARY KEY, access_token TEXT NULL, tipo TEXT NULL, empresa_id INTEGER NULL, admin INTEGER NULL)");
  }

  initDatabase() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "corvuz_talentex.db");
    //await deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: createDatabase);
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "MyDatabase.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "email TEXT,"
          "password TEXT"
          ")");
    });
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    var res = await db.insert("User", user.toJson());
    return res;
  }

  Future<User> getUser(int id) async {
    final db = await database;
    var res = await db.query("User", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var res = await db.query("User");
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
    return list;
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    var res = await db.update("User", user.toJson(),
        where: "id = ?", whereArgs: [user.id]);
    return res;
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    var res = await db.delete("User", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future deleteAllUsers() async {
    final db = await database;
    db.delete("User");
  }
}
