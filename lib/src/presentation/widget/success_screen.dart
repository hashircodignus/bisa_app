import 'dart:async';
import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavBarPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Lottie.asset(AssetResources.successLottie,
              repeat: false, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
