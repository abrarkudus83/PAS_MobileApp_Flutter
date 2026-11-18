import 'dart:convert';
import 'package:flutter_pas_labib_18/models/makanan_model.dart';
import 'package:flutter_pas_labib_18/models/makanan_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ListProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<MakananModel> listproduct = <MakananModel>[].obs;

  // 1. TAMBAHKAN 2 VARIABEL INI
  RxDouble diskonVoucher = 0.0.obs;
  RxString pesanVoucher = "".obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      final url = Uri.parse('https://dummyjson.com/products');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> products = data['products'];

        listproduct.assignAll(
          products.map((item) => MakananModel.fromJson(item)).toList(),
        );
      } else {
        print('Gagal ambil data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void hapusProduct(int index) {
    listproduct.removeAt(index);
  }

  // 2. TAMBAHKAN FUNGSI CEK VOUCHER INI
  void cekVoucher(String kode) {
    String input = kode.trim().toUpperCase();

    if (input == "HEMAT10") {
      diskonVoucher.value = 10.0;
      pesanVoucher.value = "Voucher HEMAT10 berhasil! Diskon 10%";
    } else if (input == "PAS2026") {
      diskonVoucher.value = 20.0;
      pesanVoucher.value = "Voucher PAS2026 berhasil! Diskon 20%";
    } else {
      diskonVoucher.value = 0.0;
      pesanVoucher.value = "Kode voucher tidak valid!";
    }
  }
}