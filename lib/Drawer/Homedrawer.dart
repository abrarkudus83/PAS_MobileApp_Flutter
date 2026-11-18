import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/routes.dart';
import 'package:get/get.dart';
class Homedrawer extends StatelessWidget {
  const Homedrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Makanan")),
      body: Container(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Jumlah item game
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              child: Card(
                child: InkWell(
                  onTap: () {
                    Get.toNamed (Routes.detail_product, arguments: index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}