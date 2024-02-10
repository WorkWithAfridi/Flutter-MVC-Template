import 'splash_controller.dart';

extension SplashRepo on SplashController {
  // Future<void> demoGetCall({
  //   bool loadFromStorage = true,
  // }) async {
  //   Map<String, dynamic> dataMap = {};
  //   logger.d(dataMap);
  //   try {
  //     isLoading(true);
  //     update();
  //     String? data = LocalStorage.get(key: "someKey");
  //     if (loadFromStorage) {
  //       ApiResponseModel getMealsApiResponse = ApiResponseModel.fromJson(jsonDecode(data));
  //       isLoading(false);
  //       update();
  //     }
  //     final result = await httpService.request(
  //       url: ApiEndPoints.login,
  //       method: Method.POST,
  //       params: dataMap,
  //       authToken: "Bearer ${LocalStorage.get(key: "token")}",
  //     );

  //     if (result != null) {
  //       if (result is Response) {
  //         var data = result.data;
  //         if (result.statusCode == 200) {
  //           await Future.delayed(const Duration(seconds: 1));
  //           ApiResponseModel getMealsApiResponse = ApiResponseModel.fromJson(jsonDecode(getMeals));
  //           LocalStorage.set(key: "someKey", value: jsonEncode(data));
  //         }
  //       } else {
  //         isLoading(false);
  //         Get.snackbar('Snap', 'An error occurred. :(');
  //       }
  //     }
  //   } catch (err) {
  //     logger.d("ERROR");
  //   } finally {
  //     isLoading(false);
  //   }
  //   update();
  // }
}
