import 'package:flutter/material.dart';

import '../../../backend/manager/auth_manager.dart';
import '../../../model/user.dart';
import '../../beranda/beranda_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameText = TextEditingController();
  final _passwordText = TextEditingController();

  bool? _securePassword = true;

  @override
  void dispose() {
    _usernameText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  void _showPassword() {
    setState(() => _securePassword = !_securePassword!);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usernameText,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            validator: (value) {
              if (value!.isEmpty) return 'Username harus diisi';
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _passwordText,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                    _securePassword! ? Icons.visibility : Icons.visibility_off),
                onPressed: _showPassword,
              ),
            ),
            obscureText: _securePassword!,
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthManager()
                      .login(User(
                          username: _usernameText.text,
                          password: _passwordText.text))
                      .then((User? user) {
                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Login sebagai ${user.username}'),
                        duration: const Duration(seconds: 2),
                      ));

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const BerandaScreen();
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Login gagal'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  });
                }
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
