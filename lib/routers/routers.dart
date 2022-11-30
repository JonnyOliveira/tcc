import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:projeto_app/modules/Login/Login_bindings.dart';
import 'package:projeto_app/modules/Login/Login_page.dart';

class HomeRouters {
  HomeRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/login',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
  ];
}
