import 'package:cuidapet/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet/app/core/ui/extensions/theme_extensions.dart';
import 'package:cuidapet/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:cuidapet/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:cuidapet/app/models/social_login_type.dart';
import 'package:cuidapet/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
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
              const _LoginForm(),
              const SizedBox(
                height: 20,
              ),
              const _OrSeparator(),
              const SizedBox(
                height: 8,
              ),
              _LoginRegisterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'OU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: context.primaryColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
