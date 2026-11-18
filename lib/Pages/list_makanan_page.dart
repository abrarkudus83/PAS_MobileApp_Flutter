import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/Controller/home_controller.dart';
import 'package:flutter_pas_labib_18/routes.dart';
import 'package:get/get.dart';

class ListProduct extends StatelessWidget {
  ListProduct({super.key});

  final controller = Get.put(ListProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product")),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: controller.listproduct.length,
              itemBuilder: (context, index) {
                final product = controller.listproduct[index];

                // Hitung harga setelah diskon
                double potongan = product.price * (product.discountPercentage / 100);
                double hargaDiskon = product.price - potongan;

                return Dismissible(
                  key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.hapusProduct(index);
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.detail_product, arguments: index);
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.network(
                            product.thumbnail,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$${product.price}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "\$${hargaDiskon.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Diskon: ${product.discountPercentage}%",
                                style: TextStyle(color: Colors.red),
                              ),
                              Text(
                                "Rating: ${product.rating} ⭐",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}