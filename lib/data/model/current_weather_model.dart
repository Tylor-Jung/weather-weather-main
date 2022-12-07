class CurrentWeatherModel {
  // 도시이름
  String? cityName;
  // 요약
  String? description;
  // 온도
  double? temp;
  // 최소기온
  double? minTemp;
  // 최대기온
  double? maxTemp;
  // 습도
  int? humidity;
  // 바람
  double? wind;
  // 체감
  double? feelsLike;
  // 강수
  // double? rain;
  // 기후 상태
  int? id;
  // 기후 아이콘
  String? icon;

  CurrentWeatherModel({
    this.cityName,
    this.description,
    this.temp,
    this.humidity,
    this.minTemp,
    this.maxTemp,
    this.wind,
    this.feelsLike,
    // this.rain,
    this.id,
    this.icon,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    try {
      return CurrentWeatherModel(
        cityName: json['name'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        feelsLike: json['main']['feelsLike'],
        minTemp: json['main']['temp_min'],
        maxTemp: json['main']['temp_max'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        // rain: json['rain']['1h'],
        id: json['weather'][0]['id'].toInt(),
        icon: json['weather'][0]['icon'].toString(),
      );
    } catch (error) {
      print(error);
      throw Exception(error);
    }
  }

   getWeatherIcon(int id) {
    if (id < 300) {
      return '1d';
    } else if (id < 600) {
      return '01d';
    } else if (id == 800) {
      return '01d';
    } else if (id <= 804) {
      return '01d';
    }
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "cityName": cityName,
  //     "description": description,
  //     "temp": temp,
  //     "temp_min": minTemp,
  //     "temp_max": maxTemp,
  //     "feelsLike": feelsLike,
  //     "humidity": humidity,
  //     "wind": wind,
  //     "rain": rain,
  //     "id": id,
  //   };
  // }

}
