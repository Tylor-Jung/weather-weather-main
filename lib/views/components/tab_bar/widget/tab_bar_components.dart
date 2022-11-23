import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/tabbar_controller.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TabbarController tapCtrl = Get.put(TabbarController());
    return SizedBox(
      // height: 30,
      width: 250,
      child: TabBar(
        indicatorColor: Colors.white,
        labelPadding: EdgeInsets.zero,
        controller: tapCtrl.tabController,
        tabs: tapCtrl.myTaps,
      ),
    );
  }
}
