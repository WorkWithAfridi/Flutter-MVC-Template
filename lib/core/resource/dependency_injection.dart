import 'package:clean_mvc_template/config/network_service/network_service.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.put<HttpService>(HttpService(), permanent: true);
  }
}
