import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_weather_clone/data/model/current_weather_model.dart';
import 'package:weather_weather_clone/services/location_service.dart';

const _apiKey = 'e0eec712a45b2a728c6ec140281f353f';

class CurrentDataController extends GetxController {
  final _baseUrl = 'https://api.openweathermap.org/data/2.5/';

  var isLoading = false.obs;
  CurrentWeatherModel? currentData;

  @override
  void onInit() {
    super.onInit();
    _getMyCurrentLocation();
  }

  void _fetchData(double latitude, double longitude) async {
    final endpoint =
        "weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric";
    try {
      http.Response response = await http.get(Uri.parse(_baseUrl + endpoint));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        currentData = CurrentWeatherModel.fromJson(result);
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

    return _fetchData(latitude, longitude);
  }

  currentWeatherIcon() {
    var id = CurrentWeatherModel().id;
    if (id! < 300) {
      return 'assets/weather/11d.png';
    } else if (id < 500) {
      return 'assets/weather/09d.png';
    } else if (id <= 504) {
      return 'assets/weather/10d.png';
    } else if (id == 511) {
      return 'assets/weather/13d.png';
    } else if (id <= 531) {
      return 'assets/weather/09d.png';
    } else if (id < 700) {
      return 'assets/weather/13d.png';
    } else if (id == 800) {
      return 'assets/weather/01d.png';
    } else if (id == 801) {
      return 'assets/weather/02d.png';
    } else if (id == 803) {
      return 'assets/weather/04d.png';
    } else if (id == 804) {
      return 'assets/weather/04d.png';
    }
    final icon = id;
    if (icon == null) {
      Get.snackbar(
        'error message',
        'error $icon',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
  }
}
