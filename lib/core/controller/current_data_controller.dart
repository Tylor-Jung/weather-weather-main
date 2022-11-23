import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_weather_clone/data/model/weather_model.dart';
import 'package:weather_weather_clone/services/location_service.dart';

const _apiKey = 'e0eec712a45b2a728c6ec140281f353f';

class CurrentDataControlelr extends GetxController {
  final _baseUrl = 'https://api.openweathermap.org/data/2.5/';

  var isLoading = false.obs;
  WeatherModel? currentData;

  @override
  void onInit() {
    _getMyCurrentLocation();
    super.onInit();
  }

  void fetchData(double latitude, double longitude) async {
    final endpoint =
        "weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric";
    try {
      http.Response response = await http.get(Uri.parse(_baseUrl + endpoint));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        currentData = WeatherModel.fromJson(result);
        print(result);
      } else {
        print('error fetched data');
      }
    } catch (e) {
      print(e);
    }
  }

  void _getMyCurrentLocation() async {
    final locationService = Get.find<LocationService>();
    final coordinate = await locationService.getMyCurrentLocation();
    if (coordinate == null) {
      /// 위치권한을 주지 않을 경우 이벤트 핸들링이 필요하다.
      return;
    }

    /// 받아온 coordinate으로 API 요청을 한다.
    final latitude = coordinate.latitude.toDouble();
    final longitude = coordinate.longitude.toDouble();

    fetchData(latitude, longitude);
  }
}
