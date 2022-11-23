import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/tabbar_controller.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/humidity_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/rain_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/feels_like_temp_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/temp_screen.dart';
import 'package:weather_weather_clone/views/components/tab_bar/tab_bar_screens/wind_Screen.dart';

class TabBarViewWidget extends StatelessWidget {
  TabBarViewWidget({super.key});
  final TabbarController tapCtrl = Get.put(TabbarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: TabBarView(
        controller: tapCtrl.tabController,
        children: [
          TempScreen(),
          FeelsLikeTemp(),
          RainScreen(),
          WindScreen(),
          HumidityScreen(),
        ],
      ),
    );
  }
}
