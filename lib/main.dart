import 'package:clean_mvc_template/config/routes/app_pages.dart';
import 'package:clean_mvc_template/config/routes/app_routes.dart';
import 'package:clean_mvc_template/config/theme/app_theme.dart';
import 'package:clean_mvc_template/core/resource/dependency_injection.dart';
import 'package:clean_mvc_template/core/resource/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

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
        theme: CustomAppTheme(),
        initialBinding: DependencyInjection(),
        getPages: AppPages.pages,
        initialRoute: Routes.INITIAL,
      ),
    );
  }
}
