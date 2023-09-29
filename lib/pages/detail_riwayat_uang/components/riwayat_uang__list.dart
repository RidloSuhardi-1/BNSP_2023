import 'package:flutter/material.dart';

import '../../../backend/manager/riwayat_manager.dart';
import '../../../model/riwayat_uang.dart';

class CashFlowList extends StatefulWidget {
  const CashFlowList({
    super.key,
  });

  @override
  State<CashFlowList> createState() => _CashFlowListState();
}

class _CashFlowListState extends State<CashFlowList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<RiwayatUang?>> ambilRiwayat() async {
    return await RiwayatManager().ambilRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: RefreshIndicator(
        onRefresh: () => ambilRiwayat(),
        child: FutureBuilder<List<RiwayatUang?>>(
          future: ambilRiwayat(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              var data = snapshot.data!;

              if (data.isNotEmpty) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return RiwayatCard(
                      judul: '${data[index]!.nominal}',
                      tanggal: data[index]!.tanggal!,
                      keterangan: data[index]!.keterangan!,
                      jenisRiwayat: data[index]!.jenis == 'pemasukan'
                          ? JenisRiwayat.pemasukan
                          : JenisRiwayat.pengeluaran,
                    );
                  },
                );
              }
            }

            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            return const Center(
              child: Text('Data tidak tersedia'),
            );
          },
        ),
      ),
    );
  }
}

class RiwayatCard extends StatelessWidget {
  const RiwayatCard({
    super.key,
    required this.judul,
    this.keterangan = '-',
    required this.tanggal,
    required this.jenisRiwayat,
  });

  final String judul;
  final String keterangan;
  final String tanggal;
  final JenisRiwayat jenisRiwayat;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Text(jenisRiwayat == JenisRiwayat.pemasukan ? '[+]' : '[-]',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5.0),
            Text(judul,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keterangan,
              style: const TextStyle(fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
            ),
            Text(tanggal),
          ],
        ),
        trailing: Icon(
            jenisRiwayat == JenisRiwayat.pemasukan
                ? Icons.arrow_circle_left
                : Icons.arrow_circle_right,
            size: 50,
            color: jenisRiwayat == JenisRiwayat.pemasukan
                ? Colors.green
                : Colors.red),
      ),
    );
  }
}
