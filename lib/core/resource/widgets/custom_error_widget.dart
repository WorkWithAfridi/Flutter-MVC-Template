import 'dart:io';

import 'package:flutter/material.dart';

import '../../../config/theme/theme_manager.dart';

class CustomErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorScreen({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'An error occurred:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              errorDetails.exceptionAsString(),
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                exit(1);
              },
              style: ButtonStyle(
                backgroundColor: ThemeManage.isDarkModeActive()
                    ? const MaterialStatePropertyAll(
                        Colors.orange,
                      )
                    : const MaterialStatePropertyAll(
                        Colors.white,
                      ),
              ),
              child: Text(
                'Close App',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
