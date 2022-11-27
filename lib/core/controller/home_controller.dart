import 'package:get/get.dart';
import '../../data/model/current_weather_model.dart';
import '../../data/network/weather_api_request_service.dart';
import '../../services/location_service.dart';

class HomeController extends GetxController {
  final weatherApiRequestService = Get.find<WeatherApiRequestService>();

  var isLoading = false.obs;

  int? id = 0;
  String? icon = '';
  Rxn<CurrentWeatherModel> currentData = Rxn();

  @override
  void onReady() {
    _getMyCurrentLocation();
    super.onReady();
  }
}

extension HomeControllerFunction on HomeController {
  void _fetchData(double latitude, double longitude) async {
    try {
      final body =
          await weatherApiRequestService.fetchWeather(latitude, longitude);
      if (body == null) {
        //200이 아닐경우
        Get.snackbar('api invalid reponse error', '...');
        return;
      }

      currentData.value = CurrentWeatherModel.fromJson(body);
    } catch (e) {
      Get.snackbar('error message', '날씨 데이터를 불러올 수 없어요');
    }
  }

  void _getMyCurrentLocation() async {
    final locationService = Get.find<LocationService>();
    final coordinate = await locationService.getMyCurrentLocation();
    if (coordinate == null) {
      Get.snackbar('error message', '위치 접근에 실패했습니다.');
      return;
    }

    /// 받아온 coordinate으로 API 요청을 한다.
    final latitude = coordinate.latitude.toDouble();
    final longitude = coordinate.longitude.toDouble();

    _fetchData(latitude, longitude);
  }
}
