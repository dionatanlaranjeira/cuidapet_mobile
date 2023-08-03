import 'package:cuidapet/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.module('/auth', module: AuthModule());
  }
}
