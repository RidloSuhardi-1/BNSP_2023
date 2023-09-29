import 'package:flutter/material.dart';

import 'components/menu_beranda.dart';
import 'components/rangkuman_bulan_ini.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              RangkumanBulanIni(),
              SizedBox(height: 8.0),
              MenuBeranda()
            ],
          ),
        ),
      ),
    );
  }
}
