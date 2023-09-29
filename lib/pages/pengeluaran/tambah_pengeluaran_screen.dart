import 'package:flutter/material.dart';

import 'components/tambah_pengeluaran_form.dart';

class TambahPengeluaranScreen extends StatelessWidget {
  const TambahPengeluaranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pengeluaran',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TambahPengeluaranForm(),
              const SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kembali'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
