part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

final formKey = GlobalKey<FormState>();

class _LoginFormState extends State<_LoginForm> {
  final controller = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('Precisa ser um e-mail válido')
            ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Senha precisa ter 6 caracteres')
            ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          CuidapetDefaultButton(
            onPressed: () async {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                await controller.login(_loginEC.text, _passwordEC.text);
              }
            },
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
