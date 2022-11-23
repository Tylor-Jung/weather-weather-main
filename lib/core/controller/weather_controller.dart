import 'package:get/get.dart';
import 'package:weather_weather_clone/data/model/weather_model.dart';
import 'package:weather_weather_clone/data/network/weather_api_request_service.dart';
import 'package:weather_weather_clone/services/location_service.dart';

//apiKey 변수설정

class WeatherController extends GetxController {
  // WeatherModel 객체생성
  final WeatherModel weatherModel = WeatherModel();

  // ! 아래 프로퍼티들 모델로 정리해서 화면에 업데이트

  /// 날씨  API를 요청하는 작업에서 필요한 Task
  ///* 1. 위치데이터 접근 권한을 물어본다.
  /// 2. 위치 데이터를 가져온다. -> 권한이 없을 경우, 권한이 없다는 화면으로 보여준다.
  ///* 3. 위치 데이터를 가져왔다면, API 요청을 한다.
  ///* 4. API 요청한 데이터를 받고
  /// - 성공시: 받은 데이터를 모델화하고 화면에 출력한다.
  /// - 실패시: 받은 응답의 메세지와 상태코드를 스넥바로 보여준다.
  ///
  @override
  void onInit() {
    _askForLocationPermission();
    _getMyCurrentLocation();

    super.onInit();
  }

  // Future<dynamic> _fetchWeatherData(double latitude, double longitude) async {
  //   final weatherApiRequestService = Get.find<WeatherApiRequestService>();
  //   final json =
  //       await weatherApiRequestService.fetchWeather(latitude, longitude);
  //   if (json == null) {
  //     //스넥바로 에러 메세지를 보여준다.
  //     Get.snackbar(
  //       'error message',
  //       'error $json',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }
  //   print("json: $json");
  //   final weatherModel = WeatherModel.fromJson(json);
  // }

  void _askForLocationPermission() async {
    final locationService = Get.find<LocationService>();
    locationService.askForPermission();
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
  }

  void _getMyCoordinate() async {
    final locationService = Get.find<LocationService>();
    locationService.getCoordinate(onTaskComplete: (Coordinate? coordinate) {
      if (coordinate == null) {
        /// 위치권한을 주지 않을 경우 이벤트 핸들링이 필요하다.
        return;
      }

      /// 받아온 coordinate으로 API 요청을 한다.
      final latitude = coordinate.latitude;
      final longitude = coordinate.longitude;

      print("latitude: $latitude");
      print("longitude: $longitude");
    });
  }
}

  //* WeatherModel에서 아이콘 데이터 가져오기
 //     icon = weatherModel.getWeatherIcon(status!);