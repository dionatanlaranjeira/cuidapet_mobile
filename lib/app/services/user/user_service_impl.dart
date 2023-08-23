// ignore_for_file: unused_field

import 'package:cuidapet/app/core/exceptions/failure.dart';
import 'package:cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:cuidapet/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet/app/core/helpers/constants.dart';
import 'package:cuidapet/app/core/local_storage/local_storage.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStore;

  UserServiceImpl({
    required AppLogger log,
    required UserRepository userRepository,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStore,
  })  : _localStorage = localStorage,
        _log = log,
        _localSecureStore = localSecureStore,
        _userRepository = userRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);
      if (userMethods.isNotEmpty) {
        throw UserExistsException();
      }
      await _userRepository.register(email, password);
      final userRegisterCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuário no Firebase', e, s);
      throw Failure(message: 'Erro ao criar usuário');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        throw UserNotExistsException();
      }
      if (loginMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          Failure(
              message: 'E-mail não confirmado, verifique sua caixa de spam');
        }

        final accessToken = await _userRepository.login(email, password);
        await _saveAccessToken(accessToken);
        await _confirmLogin();
      } else {
        throw Failure(
            message:
                'Login não pode ser feito por e-mail e password, por favor utilize outro método');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao realizar login no Firebase[${e.code}]', e, s);
      throw Failure(message: 'Usuário ou senha inválidos');
    }
  }

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);

  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);
    await _localSecureStore.write(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
        confirmLoginModel.refreshToken);
  }
}
