import 'package:flutter/material.dart';

class InfoPengembang extends StatelessWidget {
  const InfoPengembang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/dev_profile.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About this App'),
                SizedBox(height: 8.0),
                Text('Aplikasi ini dibuat oleh:'),
                Text('Nama: Ahmad Ridlo Suhardi'),
                Text('NIM: 2241727002'),
                Text('Tanggal: 29 September 2023'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
