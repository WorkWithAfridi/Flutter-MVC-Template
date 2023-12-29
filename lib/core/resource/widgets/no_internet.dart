import 'package:clean_mvc_template/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text('Please check your internet connection!', style: bodyMedium16),
            )
          ],
        ),
      ),
    );
  }
}
