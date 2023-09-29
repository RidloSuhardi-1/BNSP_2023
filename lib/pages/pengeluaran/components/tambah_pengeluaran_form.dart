import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../backend/manager/riwayat_manager.dart';
import '../../../model/riwayat_uang.dart';

class TambahPengeluaranForm extends StatefulWidget {
  const TambahPengeluaranForm({super.key});

  @override
  State<TambahPengeluaranForm> createState() => _TambahPengeluaranFormState();
}

class _TambahPengeluaranFormState extends State<TambahPengeluaranForm> {
  final _formKey = GlobalKey<FormState>();

  final String _jenisRiwayat = 'pengeluaran';

  final _nominalText = TextEditingController();
  final _keteranganText = TextEditingController();
  final _tanggalText = TextEditingController();

  var _tanggalDiatur = DateTime.now();

  @override
  void initState() {
    super.initState();
    _keteranganText.text = '-';
    _tanggalText.text = _formattedDate();
  }

  @override
  void dispose() {
    _nominalText.dispose();
    _keteranganText.dispose();
    super.dispose();
  }

  void reset() {
    setState(() {
      _tanggalDiatur = DateTime(2021, 1, 1);
      _nominalText.text = '';
      _keteranganText.text = '';
      _tanggalText.text = _formattedDate();
    });
  }

  void simpan(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var message = '';
      var data = RiwayatUang(
        jenis: _jenisRiwayat,
        nominal: int.parse(_nominalText.text),
        tanggal: _tanggalText.text,
        keterangan: _keteranganText.text,
      );

      RiwayatManager().simpan(data).then(
        (bool result) {
          if (result) {
            message = 'Data $_jenisRiwayat berhasil disimpan';
          } else {
            message = 'Data $_jenisRiwayat gagal disimpan';
          }

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
      );
    }
  }

  String _formattedDate() {
    return DateFormat('yyyy-MM-dd').format(_tanggalDiatur);
  }

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? pilih = await showDatePicker(
      context: context,
      initialDate: _tanggalDiatur,
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
    );

    if (pilih != null && pilih != _tanggalDiatur) {
      setState(() {
        _tanggalDiatur = pilih;
        _tanggalText.text = _formattedDate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tanggal'),
          const SizedBox(height: 8.0),
          TextFormField(
              readOnly: true,
              controller: _tanggalText,
              decoration: InputDecoration(
                  suffix: IconButton(
                onPressed: () => _pilihTanggal(context),
                icon: const Icon(Icons.calendar_month),
              ))),
          const SizedBox(height: 16.0),
          const Text('Nominal'),
          TextFormField(
            controller: _nominalText,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) return 'Nominal harus diisi';
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'masukkan nominal',
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Keterangan'),
          TextFormField(
            controller: _keteranganText,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'masukkan keterangan',
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text('Reset'),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpan(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}
