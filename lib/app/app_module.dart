import 'package:cuidapet/app/modules/auth/auth_module.dart';
import 'package:cuidapet/app/modules/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/auth',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
