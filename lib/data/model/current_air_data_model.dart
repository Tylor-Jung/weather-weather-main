class CurrentAirDataModel {
  // 대기질 리스트
  double? dust;
  double? fineDust;

  CurrentAirDataModel({
    this.dust,
    this.fineDust,
  });

  // * PM10 = 미세먼지
  // * PM2.5 = 초미세먼지

  factory CurrentAirDataModel.fromJson(Map<String, dynamic> json) {
    return CurrentAirDataModel(
      dust: json['list'][0]['components']['pm10'],
      fineDust: json['list'][0]['components']['pm2_5'],
    );
  }
}
