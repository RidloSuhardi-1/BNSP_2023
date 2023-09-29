import 'package:flutter/material.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Image.asset('assets/img/nabungcerdas.png'),
              ),
              const SizedBox(height: 8.0),
              const Text('NabungCerdas', style: TextStyle(fontSize: 36.0)),
              const LoginForm()
            ],
          ),
        ),
      )),
    );
  }
}
