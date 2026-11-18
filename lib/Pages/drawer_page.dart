import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/Controller/drawer_controller.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {

    final drawerController = Get.put(MenuDrawerController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Obx(
        () => IndexedStack(
          index: drawerController.selectedIndex.value,
          children: drawerController.listPages,
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Center(
                child: Text(
                  'Menu Aplikasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Item 1: Home
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                drawerController.changePage(0);
                Navigator.pop(context); // Tutup drawer
              },
            ),

            // Item 2: History
            ListTile(
              leading: const Icon(Icons.history_outlined),
              title: const Text('History'),
              onTap: () {
                drawerController.changePage(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Profile'),
              onTap: () {
                drawerController.changePage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}