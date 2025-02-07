import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/login_view.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/register_view.dart';

class AppRouter {
  static const String register = "/register";

  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: register, page: () => Register()),
  ];
}
