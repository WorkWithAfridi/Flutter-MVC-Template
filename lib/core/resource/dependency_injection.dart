import 'package:get/get.dart';
import 'package:clean_mvc_template/config/network_service/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
