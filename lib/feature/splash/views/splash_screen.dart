import 'package:clean_mvc_template/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: bodyMedium14,
        ),
      ),
    );
  }
}
