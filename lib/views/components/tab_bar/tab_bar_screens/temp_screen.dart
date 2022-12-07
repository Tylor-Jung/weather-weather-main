import 'package:flutter/material.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/hourly_temp_widget.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});
  // final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            24,
            (index) => HourlyTempWidget(
                time: '${index++} 시',
                weatherImage: 'assets/weather/01d.png',
                temp: '18℃'),
          )
        ],
      ),
    );
  }
}
