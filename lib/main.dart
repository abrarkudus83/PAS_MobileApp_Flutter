import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/routes.dart';
import 'package:flutter_pas_labib_18/Pages/drawer_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_pas_labib_18/Pages/login_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Learning App",
      initialRoute: Routes.login_page,
      getPages: Routes.myPages,
    );
  }
}