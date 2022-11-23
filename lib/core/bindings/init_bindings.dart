import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/current_data_controller.dart';
import 'package:weather_weather_clone/core/controller/tabbar_controller.dart';
import 'package:weather_weather_clone/core/controller/weather_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherController());
    Get.lazyPut(() => CurrentDataControlelr());
    Get.lazyPut(() => TabbarController());
  }
}
