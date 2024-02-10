import 'package:clean_mvc_template/core/resource/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/theme_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            Text(
              "Splash Screen",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Toogle theme: ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Switch.adaptive(
                    value: ThemeManage.isDarkModeActive(),
                    onChanged: (val) {
                      ThemeManage.changeThemeMode();
                    }),
              ],
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                int result = 5 ~/ 0;
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
                'Simulate Error',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            CustomTextField(),
            CustomTextField(
              isDropDown: true,
              dropDownOptions: const [
                "Test 1",
                "Test 2",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
