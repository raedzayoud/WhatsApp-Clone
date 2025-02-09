import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/forget_password_view.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/login_view.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/register_view.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/splash_view.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/widgets/forget_password_body.dart';
import 'package:whatsappclone/feature/home/presentation/view/home_view.dart';
import 'package:whatsappclone/feature/search/presenetation/view/search_view.dart';

class AppRouter {
  static const String register = "/register";
  static const String login = "/login";
  static const String home = "/home";
  static const String forgerpassword= "/forget_password";
  static const String search= "/search";

  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: "/", page: () => SplashView()),
    GetPage(name:login, page: () => Login()),
    GetPage(name: register, page: () => Register()),
    GetPage(name: forgerpassword, page: () => ForgetPasswordView()),
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: search, page: () => SearchView()),
  ];
}
