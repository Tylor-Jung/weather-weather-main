// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather_weather_clone/data/model/current_air_data_model.dart';
// import 'package:weather_weather_clone/services/location_service.dart';

// const _apiKey = 'e0eec712a45b2a728c6ec140281f353f';

// class CurrentAirController extends GetxController {
//   var isLoading = false.obs;
//   CurrentAirDataModel? airModel;
//   final _baseUrl = 'https://api.openweathermap.org/data/2.5/';

//   @override
//   void onInit() {
//     _getMyCurrentLocation();
//     super.onInit();
//   }

//   void _fetchAirData(double latitude, double longitude) async {
//     final endPoint =
//         'air_pollution?lat=$latitude&lon=$longitude&appid=$_apiKey';
//     try {
//       http.Response response = await http.get(Uri.parse(_baseUrl + endPoint));
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         airModel = CurrentAirDataModel.fromJson(result);

//         print('미세미세 데이터 : $result');
//       } else {
//         print('erroer fetch air data');
//       }
//     } catch (e) {
//       Get.snackbar('error message', '미세먼지 데이터를 불러올 수 없어요');
//     }
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

//     return _fetchAirData(latitude, longitude);
//   }

//   _getAirIcon(int aqi) {
//     // final airModel = Get.find<CurrentAirDataModel>();
//     final airIcon = CurrentAirDataModel().getAirIcon(aqi);
//     if (airIcon == null) {
//       Get.snackbar('error message', '아이콘 데이터를 불러올 수 없어요');
//       return null;
//     }
//   }
// }
