import 'package:flutter/material.dart';

import '../../../backend/manager/user_manager.dart';
import '../../../utils/preferences.dart';

class GantiPasswordForm extends StatefulWidget {
  const GantiPasswordForm({super.key});

  @override
  State<GantiPasswordForm> createState() => _GantiPasswordFormState();
}

class _GantiPasswordFormState extends State<GantiPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _passwordLamaText = TextEditingController();
  final _passwordBaruText = TextEditingController();

  bool? _securePassword = true;

  @override
  void dispose() {
    _passwordLamaText.dispose();
    _passwordBaruText.dispose();
    super.dispose();
  }

  void _showPassword() {
    setState(() => _securePassword = !_securePassword!);
  }

  void simpan(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var userdata = await Preferences().getString('userdata');
      var message = '';

      if (userdata != null) {
        await UserManager()
            .resetPassword(
          userdata,
          _passwordLamaText.text,
          _passwordBaruText.text,
        )
            .then((bool result) {
          if (result) {
            message = 'Kata sandi berhasil diubah';
          } else {
            message =
                'Kata sandi gagal diubah. Pastikan password benar dan kedua password sama';
          }

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password saat ini'),
          TextFormField(
            controller: _passwordLamaText,
            decoration: InputDecoration(
              hintText: 'Password saat ini',
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
          const Text('Password baru'),
          TextFormField(
            controller: _passwordBaruText,
            decoration: InputDecoration(
              hintText: 'Password baru',
              suffixIcon: IconButton(
                icon: Icon(
                    _securePassword! ? Icons.visibility : Icons.visibility_off),
                onPressed: _showPassword,
              ),
            ),
            obscureText: _securePassword!,
            keyboardType: TextInputType.visiblePassword,
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
