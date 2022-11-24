import 'package:flutter/material.dart';

class FeelsLikeTemp extends StatelessWidget {
  const FeelsLikeTemp({super.key});
  // final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '체감온도',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
