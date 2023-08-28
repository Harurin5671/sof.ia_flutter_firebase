import 'package:flutter_firebase_crud/pages/login_page.dart';
import 'package:flutter_firebase_crud/pages/pages.dart';
import 'package:get/get.dart';

class AppRoute {
  static String initialRoute = '/login';

  static List<GetPage<dynamic>>  routes = [
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/add', page: () => const AddNamePage()),
    GetPage(name: '/edit', page: () => const EditNamePage()),
    GetPage(name: '/login', page: () => const LoginPage())
  ];
}
