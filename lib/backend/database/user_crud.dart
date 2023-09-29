import 'dart:async';

import '../../model/user.dart';
import '../../utils/convert.dart';
import 'db_helper.dart';

const tableName = 'user';

class UserCRUD {
  static final UserCRUD instance = UserCRUD._internal();

  UserCRUD._internal();

  factory UserCRUD() {
    return instance;
  }

  Future<User?> queryUser(String username) async {
    var db = await DBHelper().database;
    var users = await db.query(
      tableName,
      where: 'username = ?',
      whereArgs: [username],
    );

    if (users.isNotEmpty) {
      return User.fromJson(convertObjectMapToDynamicMap(users.first));
    }

    return null;
  }

  Future<int> save(User user) async {
    var db = await DBHelper().database;
    var cekUser = await queryUser(user.username!);

    if (cekUser == null) return await db.insert(tableName, user.toMap());

    return 0;
  }

  Future<int> update(User user) async {
    var db = await DBHelper().database;
    return await db
        .update(tableName, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    var db = await DBHelper().database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
