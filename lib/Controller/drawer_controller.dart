import 'package:flutter/material.dart';
import 'package:flutter_pas_labib_18/Drawer/Homedrawer.dart';
import 'package:flutter_pas_labib_18/Drawer/historydrawer.dart';
import 'package:flutter_pas_labib_18/Drawer/profiledrawer.dart';
import 'package:get/get.dart';

class MenuDrawerController extends GetxController{
  var selectedIndex = 0.obs;

  final List<String> titles = [
    'Home',
    'History',  
    'Profile',
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [
    Homedrawer(),
    Historydrawer(),
    Profiledrawer(),
  ];
}