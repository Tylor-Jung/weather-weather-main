import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/bindings/init_bindings.dart';
import 'package:weather_weather_clone/data/network/weather_api_request_service.dart';
import 'package:weather_weather_clone/services/location_service.dart';
import 'package:weather_weather_clone/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(LocationService(), permanent: true);
    Get.put(WeatherApiRequestService(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: InitBindings(),
        home: HomeScreen());
  }
}

/// ! 홈 화면 구성
/// 1. 날씨 요약 내용: 현재 위치(날씨 데이터에서 준 name), 날씨아이콘, (현재온도, 1개의 위치만 지원)
/// 1.1: 위치권한을 주지 않았을때 처리 
/// 1.2: 위치권한을 받고 -> API요청하고 -> 화면에 적용시키는것 
/// 
/// 2. 오늘 시간대별 날씨 -> 따로 API 요청을 또 해야한다. 데이터를 화면에 적용
/// 
/// 네이밍 컨벤션 맞추기: Page(전체 하나의 화면), Widget(화면을 구성하는 작은 영역) 등등 