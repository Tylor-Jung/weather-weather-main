class WeatherModel {
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

  WeatherModel({
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      feelsLike: json['main']['feelsLike'],
      minTemp: json['main']['temp_min'],
      maxTemp: json['main']['temp_max'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      // rain: json['rain']['onehour'],
      id: json['weather'][0]['id'],
    );
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

  // String? getWeatherIcon(int status) {
  //   if (status < 300) {
  //     return SvgPicture.asset(
  //       'assets/svg/climacon-cloud_lightning.svg',
  //       color: Colors.black87,
  //     );
  //   } else if (status < 600) {
  //     return SvgPicture.asset('assets/svg/climacon-cloud_snow.svg',
  //         color: Colors.black87);
  //   } else if (status == 800) {
  //     return SvgPicture.asset('assets/svg/climacon-sun.svg',
  //         color: Colors.black87);
  //   } else if (status <= 804) {
  //     return SvgPicture.asset('assets/svg/climacon-cloud_sun.svg',
  //         color: Colors.black87);
  //   }
  //   return null;
  // }

}
