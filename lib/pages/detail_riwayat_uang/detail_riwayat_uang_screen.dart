import 'package:flutter/material.dart';

import 'components/riwayat_uang__list.dart';

class DetailRiwayatUangScreen extends StatefulWidget {
  const DetailRiwayatUangScreen({super.key});

  @override
  State<DetailRiwayatUangScreen> createState() =>
      _DetailRiwayatUangScreenState();
}

class _DetailRiwayatUangScreenState extends State<DetailRiwayatUangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Cashflow')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CashFlowList(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  '<<   Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
