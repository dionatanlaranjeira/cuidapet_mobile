part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

final formKey = GlobalKey<FormState>();

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
          ),
          SizedBox(
            height: 20.h,
          ),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          CuidapetDefaultButton(
            onPressed: () {
              formKey.currentState?.validate();
            },
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
