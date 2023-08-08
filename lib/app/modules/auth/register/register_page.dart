import 'package:cuidapet/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:cuidapet/app/core/ui/extensions/size_screen_extension.dart';
part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar usuário'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
