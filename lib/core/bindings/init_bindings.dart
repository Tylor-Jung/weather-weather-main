import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/home_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    /// Put으로 바꾼다.
    Get.put(HomeController());
  }
}
