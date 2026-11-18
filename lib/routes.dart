import 'package:flutter_pas_labib_18/Pages/drawer_page.dart';
import 'package:flutter_pas_labib_18/Pages/login_page.dart';
import 'package:flutter_pas_labib_18/Pages/list_makanan_page.dart';
import 'package:flutter_pas_labib_18/Pages/detailmakanan_page.dart';
import 'package:get/get.dart';
class Routes {
  static const String menu_drawer = "/menu_drawer";
  static const String login_page = "/login_page";
  static const String list_makanan= "/list_makanan";
  static const String detail_product= "/detail_product";

  static final myPages=[
    GetPage(name: menu_drawer, page: ()=> DrawerPage()),
    GetPage(name: login_page, page: ()=> LoginPage()),
    GetPage(name: list_makanan, page: ()=> ListProduct()),
    GetPage(name: detail_product, page: ()=> DetailProductPage()),
  ];
}