import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:e_commerce_flutter/screen/home_screen.dart';
import 'package:get/get.dart'; // Import Get package
import 'core/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.lightAppTheme,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Use GetX's delayed redirection
    Future.delayed(const Duration(seconds: 3), () {
      // Use Get.off instead of Navigator.pushReplacement
      Get.off(() => const HomeScreen());
    });

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Welcome to MyApp',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
