import 'package:cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:cuidapet/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 162.w,
                height: 130.h,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 16,
              ),
              CuidapetTextFormField(
                label: 'Login',
                controller: loginEC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valor obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CuidapetTextFormField(
                  label: 'Senha',
                  controller: passwordEC,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Valor obrigatório';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 16,
              ),
              CuidapetDefaultButton(
                onPressed: () {},
                label: 'Entrar',
              ),
              RoundedButtonWithIcon(
                onTap: () {},
                width: 200,
                color: const Color(0XFF3B5999),
                icon: CuidapetIcons.facebook,
                label: 'Facebook',
              ),
              RoundedButtonWithIcon(
                onTap: () {},
                width: 200,
                color: const Color(0XFFEE5C2E),
                icon: CuidapetIcons.google,
                label: 'Google',
              ),
              RoundedButtonWithIcon(
                onTap: () {},
                width: 200,
                color: Colors.red,
                icon: CuidapetIcons.apple,
                label: 'Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
