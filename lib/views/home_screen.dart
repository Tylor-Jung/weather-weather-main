import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/core/controller/current_air_controller.dart';
import 'package:weather_weather_clone/core/controller/current_data_controller.dart';
import 'package:weather_weather_clone/core/controller/tabbar_controller.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_components.dart';
import 'package:weather_weather_clone/views/components/tab_bar/widget/tab_bar_view_components.dart';

class HomeScreen extends StatelessWidget {
  TabbarController homeController = Get.put(TabbarController());
  CurrentDataController currentCntl = Get.put(CurrentDataController());
  CurrentAirController airCntl = Get.put(CurrentAirController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => currentCntl.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              // ! Drawer 사용해서 해야함
              // drawer: , <= 여기에
              drawer: const Drawer(),
              appBar: AppBar(
                elevation: 0,
                actions: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {}, // 날씨정보 공유하기
                        icon: const Icon(Icons.share),
                      ),
                      IconButton(
                        onPressed: () {}, // 추가하기?
                        icon: const Icon(Icons.add, size: 35),
                      ),
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            height: 400,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    '(현재 위치)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ), // 현재위치 text
                                  Text(
                                    '${currentCntl.currentData?.cityName}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  Text(
                                    '${currentCntl.currentData?.description}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ), // 실시간 날씨

                                  // ! 날씨상황을 나타내는 아이콘 => null 로 리턴됨 ㅡㅡ

                                  Image.asset(
                                    height: 100,
                                    width: 100,
                                    'assets/weather/10d.png',
                                    // 'assets/weather/${currentCntl.currentData?.icon}.png',
                                  ),

                                  Text(
                                    '${currentCntl.currentData?.temp}℃',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ), // 실제온도
                                  const Text(
                                    '어제보다 x℃ 가 높아요',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ), // 어제와 비교, 높아요/낮아요
                                  Text(
                                    '최고 ${currentCntl.currentData?.minTemp}℃ / 최저 ${currentCntl.currentData?.maxTemp}℃',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // 미세먼지 지수 // 우측정렬
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Image.asset(
                                          'assets/dust/good.png',
                                          // 'assets/dust/${airCntl.airModel?.dustIcon}.png',
                                          width: 38,
                                          height: 38,
                                        ),
                                      ),
                                      const SizedBox(
                                          width: 10), // 미세먼지에 따른 이미지 파일 집어넣기
                                      Text(
                                        '${airCntl.airModel?.dust}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                      const Text(
                                        ' ㎍/㎥',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        children: const [
                                          Text(
                                            '미세미세',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 4), // 미세미세 타이틀
                                          Text(
                                            '매우나쁨',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ), // 미세먼지 데이터 특정 값 range 안에서 특정 메시지 출력
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.blue[600],
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const SizedBox(width: 10),
                                  const Text(
                                    '오늘',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 90),
                                  const TabBarWidget(),
                                ],
                              ),
                              TabBarViewWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
