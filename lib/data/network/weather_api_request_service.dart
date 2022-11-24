import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_weather_clone/data/model/current_weather_model.dart';

class WeatherApiRequestService extends GetxService {
  // 생성자를 통해 URL을 입력 받도록 함.
  // ! 위도 경도를 받아서 URL 생성해서 받는게 좋음

  final _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  final _apiKey = 'e0eec712a45b2a728c6ec140281f353f';

  // Future<dynamic> getJsonData(String url) async {
  //   http.Response response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     String jsonData = response.body;
  //     var parsingData = jsonDecode(jsonData);
  //     return parsingData;
  //   }
  //   // ! 200이 아닐 경우?
  // }

  Future<Map<String, dynamic>> fetchWeather(
      double latitude, double longitude) async {
    final enpoint =
        "weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric";

    final uri = Uri.parse(_baseUrl + enpoint);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      /// 재대로 데이터가 오지 않을 경우 핸들링
      return Future.error('$response');
    }
    //200일 경우
    var json = jsonDecode(response.body);
    return json;
  }

  Future<Map<String, dynamic>> fetchAirData(
      double latitude, double longitude) async {
    final enpoint = "air_pollution?lat=$latitude&lon=$longitude&appid=$_apiKey";

    final uri = Uri.parse(_baseUrl + enpoint);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      /// 재대로 데이터가 오지 않을 경우 핸들링
      return Future.error('$response');
    }
    //200일 경우
    var airJson = jsonDecode(response.body);
    return airJson;
  }
}
