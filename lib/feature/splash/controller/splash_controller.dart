import 'package:get/get.dart' hide Response;

import '../../../config/network_service/network_service.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  HttpService httpService = HttpService();
}
