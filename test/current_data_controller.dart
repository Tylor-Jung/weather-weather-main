// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather_weather_clone/data/model/current_weather_model.dart';
// import 'package:weather_weather_clone/services/location_service.dart';

// import '../../data/network/weather_api_request_service.dart';

// const _apiKey = 'e0eec712a45b2a728c6ec140281f353f';

// class CurrentDataController extends GetxController {
//   final _baseUrl = 'https://api.openweathermap.org/data/2.5/';

//   // final weatherApiRequestService = Get.find<WeatherApiRequestService>();

//   var isLoading = false.obs;
//   int? id = 0;
//   String? icon = '';
//   CurrentWeatherModel? currentData;

//   @override
//   void onInit() {
//     _getMyCurrentLocation();
//     super.onInit();
//   }

//   void _fetchData(double latitude, double longitude) async {
//     // final body =
//     //     await weatherApiRequestService.fetchAirData(latitude, longitude);

//     final endPoint =
//         "weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric";
//     try {
//       http.Response response = await http.get(Uri.parse(_baseUrl + endPoint));
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         currentData = CurrentWeatherModel.fromJson(result);

//         print('아 왜 안돼는거냐고 ㅡㅡ: $result');
//       } else {
//         print('error fetched data');
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar('error message', '날씨 데이터를 불러올 수 없어요');
//     }
//     _CurrentWehaterIcon();
//   }

//   void _getMyCurrentLocation() async {
//     final locationService = Get.find<LocationService>();
//     final coordinate = await locationService.getMyCurrentLocation();
//     if (coordinate == null) {
//       Get.snackbar('error message', '위치 접근에 실패했습니다.');
//       return;
//     }

//     /// 받아온 coordinate으로 API 요청을 한다.
//     final latitude = coordinate.latitude.toDouble();
//     final longitude = coordinate.longitude.toDouble();

//     return _fetchData(latitude, longitude);
//   }

//   _CurrentWehaterIcon() {
//     var id = currentData?.id;
//     print('id값 :$id');
//     if (id! < 300) {
//       return '1d';
//     } else if (id < 600) {
//       return '01d';
//     } else if (id == 800) {
//       return '01d';
//     } else if (id <= 804) {
//       return '01d';
//     }
//     if (id == null) {
//       Get.snackbar(
//         'error message',
//         'error $id',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//   }
// }
