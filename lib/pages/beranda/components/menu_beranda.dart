import 'package:flutter/material.dart';

import '../../detail_riwayat_uang/detail_riwayat_uang_screen.dart';
import '../../pemasukan/tambah_pemasukan_screen.dart';
import '../../pengaturan/pengaturan_screen.dart';
import '../../pengeluaran/tambah_pengeluaran_screen.dart';

class MenuBeranda extends StatelessWidget {
  const MenuBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        Material(
          color: Colors.white,
          shadowColor: Colors.grey.shade300,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TambahPemasukanScreen();
              }));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.paid,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 4.0),
                Text('Tambah Pemasukan')
              ],
            ),
          ),
        ),
        Material(
          color: Colors.white,
          shadowColor: Colors.grey.shade300,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TambahPengeluaranScreen();
              }));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 4.0),
                Text('Tambah Pengeluaran')
              ],
            ),
          ),
        ),
        Material(
          color: Colors.white,
          shadowColor: Colors.grey.shade300,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailRiwayatUangScreen();
              }));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 4.0),
                Text('Detail Cashflow')
              ],
            ),
          ),
        ),
        Material(
          color: Colors.white,
          shadowColor: Colors.grey.shade300,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PengaturanScreen();
              }));
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 4.0),
                Text('Pengaturan')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
