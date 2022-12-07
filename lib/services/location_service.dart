import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_weather_clone/views/location_permission_screen.dart';

/// 위치 권한에 대한 작업을 하는 서비스
class LocationService extends GetxService {
  /// 앱 시작시 위치권한을 물어본다.
  void askForPermission() async {
    await Geolocator.requestPermission();
  }

  /// async, await으로 하는 방법
  Future<Coordinate?> getMyCurrentLocation() async {
    try {
      final status = await Geolocator.checkPermission();

      /// 권한을 주지 않았거나 알수 없는 경우
      if (status == LocationPermission.denied ||
          status == LocationPermission.unableToDetermine ||
          status == LocationPermission.deniedForever) {
        return null;
      }

      /// ! 권한을 주지 않았을 경우에는 어떻게 할것인지? Reverse Engineering과 리서치가 필요하다.
      Position myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final latitude = myLocation.latitude;
      final longitude = myLocation.longitude;
      return Coordinate(latitude, longitude);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Lamda 또는 Closure 방식으로 데이터를 전달하는 방식
  void getCoordinate({required Function(Coordinate?) onTaskComplete}) async {
    final status = await Geolocator.checkPermission();

    /// 권한을 주지 않았거나 알수 없는 경우
    if (status == LocationPermission.denied ||
        status == LocationPermission.unableToDetermine ||
        status == LocationPermission.deniedForever) {
      onTaskComplete(null);
      return Get.to(() => const LocationPermissionScreen());
    }

    Position myLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latitude = myLocation.latitude;
    final longitude = myLocation.longitude;
    final coordinate = Coordinate(latitude, longitude);
    onTaskComplete(coordinate);
  }
}

class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate(this.latitude, this.longitude);
}
