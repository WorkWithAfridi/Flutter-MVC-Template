import 'package:clean_mvc_template/config/network_service/network_service.dart';
import 'package:get/get.dart' hide Response;

class SplashController extends GetxController {
  var isLoading = false.obs;
  HttpService httpService = HttpService();
}
