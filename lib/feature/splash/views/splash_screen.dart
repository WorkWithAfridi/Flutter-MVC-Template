import 'package:clean_mvc_template/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            const Text(
              "Splash Screen",
              style: bodyMedium14,
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                int result = 5 ~/ 0;
              },
              child: const Text('Simulate Error'),
            ),
          ],
        ),
      ),
    );
  }
}
