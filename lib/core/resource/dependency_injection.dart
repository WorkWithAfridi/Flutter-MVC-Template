import 'package:get/get.dart';

import '../../config/network/network-c.dart';
import '../../config/network/network-service-c.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<NetworkService>(NetworkService(), permanent: true);
  }
}
