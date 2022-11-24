import 'package:get/get.dart';

class CurrentAirDataModel {
  // 대기질 리스트
  double? dust;
  int? aqi;
  String? dustIcon;

  CurrentAirDataModel({
    this.dust,
    this.aqi,
    this.dustIcon,
  });

  // * PM10 = 미세먼지
  // * PM2.5 = 초미세먼지

  factory CurrentAirDataModel.fromJson(Map<String, dynamic> json) {
    return CurrentAirDataModel(
      dust: json['list'][0]['components']['pm10'],
      aqi: json['list'][0]['aqi'],
    );
  }

  getAirIcon(int aqi) {
    final aqi = CurrentAirDataModel().aqi;
    final dustIcon = aqi;
    if (aqi == 1) {
      return 'good';
    } else if (aqi == 2) {
      return 'fair';
    } else if (aqi == 3) {
      return 'moderate';
    } else if (aqi == 4) {
      return 'poor';
    } else if (aqi == 5) {
      return 'bad';
    }
    if (dustIcon == null) {
      Get.snackbar('error message', '아이콘을 불러올 수 없습니다.');
    }
    return null;
  }
}
