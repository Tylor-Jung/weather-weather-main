import 'package:get/get.dart';

class CurrentAirDataModel {
  // 대기질 리스트
  double dust;
  int aqi;

  CurrentAirDataModel({
    required this.dust,
    required this.aqi,
  });

  // * PM10 = 미세먼지
  // * PM2.5 = 초미세먼지

  factory CurrentAirDataModel.fromJson(Map<String, dynamic> json) {
    try {
      return CurrentAirDataModel(
        dust: json['list'][0]['components']['pm10'],
        aqi: json['list'][0]['main']['aqi'].toInt(),
      );
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  String getIconPath() {
    switch (aqi) {
      case 1:
        return "assets/dust/good.png";
      case 2:
        return "assets/dust/fair.png";
      case 3:
        return "assets/dust/moderate.png";
      case 4:
        return "assets/dust/poor.png";
      case 5:
        return "assets/dust/bad.png";
      default:
        throw Exception();
    }
  }
}
