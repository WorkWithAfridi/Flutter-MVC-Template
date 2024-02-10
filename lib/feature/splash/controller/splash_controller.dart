import 'dart:convert';

import 'package:get/get.dart' hide Response;

import '../../../config/network/network-c.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/helper/logger.dart';
import '../../../core/resource/local_storage/local_storage.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;
  NetworkController networkController = Get.find();

  Future<void> demoGetCall({
    bool loadFromStorage = true,
  }) async {
    Map<String, dynamic> dataMap = {};
    logger.d(dataMap);
    try {
      isLoading(true);
      update();
      String? data = LocalStorage.get(key: "someKey");
      if (loadFromStorage) {
        ApiResponseModel getMealsApiResponse = ApiResponseModel.fromJson(jsonDecode(data!));
        isLoading(false);
        update();
      }
      final result = await networkController.request(
        url: ApiEndPoints.login,
        method: Method.POST,
        params: dataMap,
      );
    } catch (err) {
      logger.e(err);
    }
  }
}

class ApiResponseModel {
  static ApiResponseModel fromJson(jsonDecode) {
    return ApiResponseModel();
  }
}
