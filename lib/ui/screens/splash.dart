import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/screens/root.dart';

import '../widgets/other_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => {Get.off(RootScreen())});
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 111.0,
              backgroundColor: Colors.green,
              backgroundImage: AssetImage('assets/icons/logo.png'),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: loadingSpinkit(),
            ),
          ],
        ),
      )),
    );
  }
}
