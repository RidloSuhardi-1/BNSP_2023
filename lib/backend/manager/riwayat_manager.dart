import '../../model/riwayat_uang.dart';
import '../database/riwayat_uang_crud.dart';

enum JenisRiwayat { pemasukan, pengeluaran }

class RiwayatManager {
  static final RiwayatManager instance = RiwayatManager._internal();

  RiwayatManager._internal();

  factory RiwayatManager() {
    return instance;
  }

  Future<List<RiwayatUang?>> ambilRiwayat() async {
    return await RiwayatUangCRUD().queryRiwayat();
  }

  Future<int> ambilDanHitungRiwayat(JenisRiwayat jenisRiwayat) async {
    int jumlah = 0;
    String filterRiwayat =
        jenisRiwayat == JenisRiwayat.pemasukan ? 'pemasukan' : 'pengeluaran';

    var data =
        await RiwayatUangCRUD().queryRiwayat(jenisRiwayat: filterRiwayat);

    if (data.isNotEmpty) {
      for (var item in data) {
        jumlah += item!.nominal!;
      }
    }

    return jumlah;
  }

  Future<bool> simpan(RiwayatUang data) async {
    int result = await RiwayatUangCRUD().save(data);
    if (result != 0) {
      print('Data ${data.jenis} berhasil ditambahkan');
      return true;
    }

    print('Data ${data.jenis} gagal ditambahkan');
    return false;
  }

  Future<bool> hapus(int id) async {
    int result = await RiwayatUangCRUD().delete(id);

    if (result != 0) {
      print('Riwayat berhasil dihapus');
      return true;
    }

    print('Gagal menghapus riwayat');
    return false;
  }
}
