import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:pooulp_flutter/core/core.dart';

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageServices().init());
  // appCheckPermission();
  // DBService, ...
}

class StorageServices extends GetxService {
  String? languageCode;
  // bool? isUsingMap;

  Future<StorageServices> init() async {
    await GetStorage.init();
    languageCode = readData('language').toString();
    if (languageCode == "null") {
      await writeData('language', 'en');
      readData('language');
    }
    // if (readData('usingMap') != null) {
    //   isUsingMap = readData('usingMap') as bool;
    // } else {
    //   await writeData('usingMap', false);
    //   readData('usingMap');
    // }
    // if (isUsingMap == null) {
    //   await writeData('usingMap', false);
    //   readData('usingMap');
    // }
    return this;
  }

  Future<void> writeData(String key, dynamic value) async {
    await GetStorage().write(key, value);
  }

  // String? readData(String key) {
  //   return GetStorage().read(key);
  // }

  dynamic readData(String key) {
    return GetStorage().read(key);
  }
}
