import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/weather_controller.dart';

class FeelsLikeTemp extends StatelessWidget {
  FeelsLikeTemp({super.key});
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${weatherController}',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
