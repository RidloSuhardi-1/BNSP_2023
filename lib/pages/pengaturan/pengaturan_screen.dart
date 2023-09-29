import 'package:flutter/material.dart';

import '../../backend/manager/auth_manager.dart';
import '../login/login_screen.dart';
import 'components/ganti_password_form.dart';
import 'components/info_pengembang.dart';

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GantiPasswordForm(),
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
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthManager().logout();

                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }), (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    child:
                        const Text('Keluar', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16.0),
                const InfoPengembang(),
              ],
            )),
      ),
    );
  }
}
