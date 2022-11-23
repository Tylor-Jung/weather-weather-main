import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/weather_controller.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/hourly_temp.dart';

class TempScreen extends StatelessWidget {
  TempScreen({super.key});
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            24,
            (index) => HourlyTemp(
                time: '${index + 1} 시',
                weatherImage: 'assets/weather/01d.png',
                temp: '18℃'),
          )
        ],
      ),
    );
  }
}
