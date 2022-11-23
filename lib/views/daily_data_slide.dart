import 'package:flutter/material.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_components.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_view_components.dart';

class DailyDataSlide extends StatelessWidget {
  const DailyDataSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      // height: 30,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(width: 10),
              const Text(
                '오늘',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 100),
              const TabBarWidget(),
            ],
          ),
          TabBarViewWidget(),
        ],
      ),
    );
  }
}
