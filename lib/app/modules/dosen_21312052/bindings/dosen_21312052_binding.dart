import 'package:get/get.dart';

import '../controllers/dosen_21312052_controller.dart';

class Dosen21312052Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dosen21312052Controller>(
      () => Dosen21312052Controller(),
    );
  }
}
