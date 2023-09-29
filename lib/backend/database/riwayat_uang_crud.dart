import '../../model/riwayat_uang.dart';
import '../../utils/convert.dart';
import 'db_helper.dart';

const tableName = 'riwayat_uang';

class RiwayatUangCRUD {
  static final RiwayatUangCRUD instance = RiwayatUangCRUD._internal();

  RiwayatUangCRUD._internal();

  factory RiwayatUangCRUD() {
    return instance;
  }

  Future<List<RiwayatUang?>> queryRiwayat({String? jenisRiwayat}) async {
    var db = await DBHelper().database;
    var result = await db.rawQuery(
        'SELECT * FROM $tableName ${jenisRiwayat != null ? 'WHERE jenis = \'$jenisRiwayat\'' : ''}');

    if (result.isNotEmpty) {
      return result.map((item) {
        return RiwayatUang.fromJson(convertObjectMapToDynamicMap(item));
      }).toList();
    }

    return [];
  }

  Future<int> save(RiwayatUang data) async {
    var db = await DBHelper().database;
    return await db.insert(tableName, data.toMap());
  }

  Future<int> update(RiwayatUang data) async {
    var db = await DBHelper().database;
    return await db
        .update(tableName, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
  }

  Future<int> delete(int id) async {
    var db = await DBHelper().database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
