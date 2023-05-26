import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/screens/channel.dart';
import 'package:sakuralifestoryschool/ui/screens/home.dart';

import '../../ui/screens/trending.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;

  List<Widget> pages = [
    HomeScreen(),
    ChannelScreen(),
    TrendingOnScreen(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  Future<void> changePage(int _index) async {
    currentIndex.value = _index;
  }
}