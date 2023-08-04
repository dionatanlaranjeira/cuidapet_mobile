import 'package:cuidapet/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CuidapetTextFormField(
              label: 'Login',
              obscureText: false,
            ),
            CuidapetTextFormField(
              label: 'Senha',
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
