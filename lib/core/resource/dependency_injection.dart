import 'package:get/get.dart';

import '../../config/network_service/network_controller.dart';
import '../../config/network_service/network_service.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<HttpService>(HttpService(), permanent: true);
  }
}
