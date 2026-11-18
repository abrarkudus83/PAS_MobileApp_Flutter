import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/Controller/home_controller.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});

  final listController = Get.find<ListProductController>();
  final TextEditingController voucherC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Menerima index dari halaman sebelumnya (default 0 jika null)
    final int index = Get.arguments ?? 0;
    final product = listController.listproduct[index];

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.thumbnail,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Input Kode Voucher
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: voucherC,
                          decoration: const InputDecoration(
                            hintText: "Kode voucher (HEMAT10 / PAS2026)",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          listController.cekVoucher(voucherC.text);
                        },
                        child: const Text("Pakai"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Rincian Harga, Diskon, Voucher & Pajak
                  Obx(() {
                    double potonganProduk =
                        product.price * (product.discountPercentage / 100);
                    double hargaDiskon = product.price - potonganProduk;

                    double potonganVoucher = hargaDiskon *
                        (listController.diskonVoucher.value / 100);
                    double hargaSetelahVoucher =
                        hargaDiskon - potonganVoucher;

                    double pajak = hargaSetelahVoucher * 0.11;
                    double totalBayar = hargaSetelahVoucher + pajak;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (listController.pesanVoucher.value.isNotEmpty)
                          Text(
                            listController.pesanVoucher.value,
                            style: TextStyle(
                              color: listController.diskonVoucher.value > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text(
                          "Harga Awal: \$${product.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Diskon Produk (${product.discountPercentage}%): \$${hargaDiskon.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        if (listController.diskonVoucher.value > 0)
                          Text(
                            "Diskon Voucher (${listController.diskonVoucher.value}%): -\$${potonganVoucher.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                        Text(
                          "Pajak (11%): \$${pajak.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Total Bayar: \$${totalBayar.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    );
                  }),

                  const SizedBox(height: 12),
                  Text(
                    "Rating: ${product.rating} ⭐",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Review",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: product.reviews.length,
                    itemBuilder: (context, idx) {
                      final review = product.reviews[idx];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(review.reviewerName),
                        subtitle: Text(review.comment),
                        trailing: Text("${review.rating} ⭐"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}