import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/Controller/login_controller.dart';
import 'package:flutter_pas_labib_18/Custom/custom_app.dart';
import 'package:flutter_pas_labib_18/Custom/Custom_judul_app.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.help_outline)),
                ],
              ),
              
              CustomJudulApp(myjudul: "Instagram"),

              SizedBox(height: 20),
              TextField(
                controller: controller.txtUsername,
                decoration: InputDecoration(
                  hintText: "input username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              TextField(
                controller: controller.txtPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "input pw",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ), // panggil class TextPass dari file custom_textfieldpass.dart
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Text("Lanjut"),
                ),
              ), // panggil class ButtonLanjut dari file custome_buttonlanjut.dart
              SizedBox(height: 20),
              SizedBox(height: 20),
              App(), // panggil class ButtonApp dari file custom_buttonapp.dart
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Dengan masuk di sini, kamu menyetujui "),
                    TextSpan(
                      text: "Syarat & Ketentuan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 160, 54, 8),
                      ),
                    ),
                    TextSpan(text: " serta "),
                    TextSpan(
                      text: "Kebijakan Privasi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 176, 43, 13),
                      ),
                    ),
                    TextSpan(text: " Instagram."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}