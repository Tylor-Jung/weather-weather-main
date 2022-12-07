class HourlyWeatherModel {
  // 시간
  double? dt;
  // 온도
  double? temp;

  HourlyWeatherModel({
    this.dt,
    this.temp,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    try {
      return HourlyWeatherModel(
        dt: json['list'][0]["dt"],
        temp: json['list'][0]['main']["temp"],
      );
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
