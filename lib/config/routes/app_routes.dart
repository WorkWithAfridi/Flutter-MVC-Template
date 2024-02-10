import 'package:get/get.dart';

import '../../core/resource/widgets/no_internet.dart';
import '../../feature/splash/views/splash_screen.dart';
import 'app_pages.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const SplashScreen()),
    GetPage(name: Routes.NOINTERNET, page: () => const NoInternet()),
  ];
}
