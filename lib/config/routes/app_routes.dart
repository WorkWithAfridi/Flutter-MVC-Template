import 'package:clean_mvc_template/config/routes/app_pages.dart';
import 'package:clean_mvc_template/core/resource/widgets/no_internet.dart';
import 'package:clean_mvc_template/feature/splash/views/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const SplashScreen()),
    GetPage(name: Routes.NOINTERNET, page: () => const NoInternet()),
  ];
}
