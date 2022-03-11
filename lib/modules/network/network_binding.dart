import 'package:get/get.dart';

import '../modules.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
