import 'package:flutter/material.dart';

import 'backend/manager/auth_manager.dart';
import 'model/user.dart';
import 'pages/beranda/beranda_screen.dart';
import 'pages/login/login_screen.dart';
import 'utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    cekInstalasiAwal().then((_) => cekLogin());
  }

  Future<void> cekInstalasiAwal() async {
    var freshInstall = await Preferences().getBool('fresh_install');

    if (freshInstall == null) {
      bool hasil = await AuthManager()
          .register(User(username: 'user', password: 'user'));

      if (hasil) {
        Preferences().setBool('fresh_install', false);
        print('Pengguna awal berhasil ditambahkan');
      }
    }
  }

  Future<void> cekLogin() async {
    var userdata = await Preferences().getString('userdata');

    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      if (userdata != null) {
        return const BerandaScreen();
      } else {
        return const LoginScreen();
      }
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'NabungCerdas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
