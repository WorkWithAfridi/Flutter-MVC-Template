import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static set({required String key, required dynamic value}) {
    return GetStorage().write("token", value);
  }

  static get({required String key}) {
    return GetStorage().read("token");
  }
}
