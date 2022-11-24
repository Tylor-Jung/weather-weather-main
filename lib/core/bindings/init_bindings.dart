import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/current_air_controller.dart';
import 'package:weather_weather_clone/core/controller/current_data_controller.dart';
import 'package:weather_weather_clone/core/controller/tabbar_controller.dart';
import 'package:weather_weather_clone/core/controller/location_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
    Get.lazyPut(() => CurrentDataController());
    Get.lazyPut(() => CurrentAirController());
    Get.lazyPut(() => TabbarController());
  }
}
