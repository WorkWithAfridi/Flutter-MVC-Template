import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'config/routes/app_pages.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';
import 'config/theme/theme_manager.dart';
import 'core/resource/dependency_injection.dart';
import 'core/resource/widgets/custom_error_widget.dart';

final GlobalKey<NavigatorState> globalNavKey = GlobalKey<NavigatorState>();

void main(List<String> args) async {
  await initApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    globalNavKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => CustomErrorScreen(errorDetails: details),
      ),
    );
  };

  runApp(const MyApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'MyApp',
        navigatorKey: globalNavKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeManage.getThemeMode(),
        initialBinding: DependencyInjection(),
        getPages: AppPages.pages,
        initialRoute: Routes.INITIAL,
      ),
    );
  }
}
