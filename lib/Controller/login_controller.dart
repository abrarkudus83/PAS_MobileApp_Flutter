import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas_labib_18/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isloading = false.obs;

  var LoginModel = Rxn<Loginmodel>();

  void login() async {
    if(txtUsername.text.toString().isEmpty ||
      txtPassword.text.toString().isEmpty){
    Get.snackbar("error", "username dan password harus terisi");
    }else{
      try{
        isloading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");
        final response = await http.post(
          url,
          body: {
            "username": txtUsername.text.toString(),
            "password": txtPassword.text.toString(),
          },
        );

        isloading.value = false;
        if(response.statusCode == 200){
          LoginModel.value = loginModelFromJson(response.body);
          if(LoginModel.value!.status){
            Get.snackbar("Berhasil", LoginModel.value!.message.toString());
            Get.offAllNamed("/menu_drawer");
           } else {
            Get.snackbar("gagal", LoginModel.value!.message.toString());
          }
        } else {
          Get.snackbar("gagal", "cek internet connection");
        }
      } catch (e) {
        Get.snackbar("gagal", e.toString());
        print("errornya" +e.toString());
      }
    }
  }
}