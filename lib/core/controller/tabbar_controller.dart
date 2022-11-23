import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarController extends GetxController with GetTickerProviderStateMixin {
  // 하단 탭바 컨트롤러
  late TabController tabController;
  // 현재시간

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  final List<Tab> myTaps = <Tab>[
    const Tab(
      child: Text('온도'),
    ),
    const Tab(
      child: Text('체감'),
    ),
    const Tab(
      child: Text('강수'),
    ),
    const Tab(
      child: Text('바람'),
    ),
    const Tab(
      child: Text('습도'),
    ),
  ];

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  // void _loadData() {
  // setTargetUser();

  // 포스트 리스트 로드
  // 사용자 정보 로드
  // }
}
