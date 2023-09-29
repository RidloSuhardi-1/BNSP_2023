import 'package:flutter/material.dart';

import '../../../backend/manager/riwayat_manager.dart';

class RangkumanBulanIni extends StatefulWidget {
  const RangkumanBulanIni({super.key});

  @override
  State<RangkumanBulanIni> createState() => _RangkumanBulanIniState();
}

class _RangkumanBulanIniState extends State<RangkumanBulanIni> {
  int _pemasukanBulanan = 0;
  int _pengeluaranBulanan = 0;

  @override
  void initState() {
    super.initState();
    _hitungTotal();
  }

  void _hitungTotal() async {
    _pemasukanBulanan =
        await RiwayatManager().ambilDanHitungRiwayat(JenisRiwayat.pemasukan);
    _pengeluaranBulanan =
        await RiwayatManager().ambilDanHitungRiwayat(JenisRiwayat.pengeluaran);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Rangkuman Bulan Ini',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8.0),
          Text('Pengeluaran: Rp. $_pengeluaranBulanan',
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8.0),
          Text('Pemasukan: Rp. $_pemasukanBulanan',
              style:
                  const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {
                _hitungTotal();
              },
              child: const Text('Segarkan'))
        ],
      ),
    );
  }
}
