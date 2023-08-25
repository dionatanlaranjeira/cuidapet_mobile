// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:cuidapet/app/core/exceptions/failure.dart';
import 'package:cuidapet/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet/app/core/ui/widgets/loader.dart';
import 'package:cuidapet/app/core/ui/widgets/messages.dart';
import 'package:cuidapet/app/models/social_login_type.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/services/user/user_service.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;
  LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> login(String login, String password) async {
    try {
      Loader.show();
      await _userService.login(login, password);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on Failure catch (e, s) {
      final errorMessage = e.message ?? 'Erro ao realizar login';
      _log.error(errorMessage, e, s);
      Loader.hide();
      Messages.alert(errorMessage);
    } on UserNotExistsException {
      const errorMessage = 'Usuário não cadastrado';
      _log.error(errorMessage);
      Loader.hide();
      Messages.alert('Usuário não cadastrado');
    }
  }

  Future<void> socialLogin(SocialLoginType socialLoginType) async {
    try {
      Loader.show();
      await _userService.socialLogin(socialLoginType);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on Failure catch (e, s) {
      Loader.hide();
      _log.error('Erro ao realizar login', e, s);
      Messages.alert(e.message ?? 'Erro ao realizar login');
    }
  }
}
