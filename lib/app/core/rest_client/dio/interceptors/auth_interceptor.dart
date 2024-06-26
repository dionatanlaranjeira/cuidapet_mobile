import 'package:cuidapet/app/core/helpers/constants.dart';
import 'package:cuidapet/app/core/local_storage/local_storage.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  // ignore: unused_field
  final AppLogger _log;
  final AuthStore _authStore;

  AuthInterceptor({
    required LocalStorage localStorage,
    required AppLogger log,
    required AuthStore authStore,
  })  : _log = log,
        _authStore = authStore,
        _localStorage = localStorage;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;
    if (authRequired) {
      final accessToken = await _localStorage
          .read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);
      if (accessToken == null) {
        _authStore.logout();
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expired token',
            type: DioExceptionType.cancel,
          ),
        );
      }
      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }
}
