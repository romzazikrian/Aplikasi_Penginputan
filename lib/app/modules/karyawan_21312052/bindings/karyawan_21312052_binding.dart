import 'package:get/get.dart';

import '../controllers/karyawan_21312052_controller.dart';

class Karyawan21312052Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Karyawan21312052Controller>(
      () => Karyawan21312052Controller(),
    );
  }
}
