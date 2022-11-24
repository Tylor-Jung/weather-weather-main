import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

// ! MyLocation이 무엇인지? 데이터 모델인지? 아니면 어떤 기능 수행하는 서비스 형태의 클래스인지?
class MyLocation {
  // 위도
  double? myLatitude;
  // 경도
  double? myLongitude;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      myLatitude = myLocation.latitude;
      myLongitude = myLocation.longitude;
    } catch (e) {
      // ! 아래의 텍스트가 보여지지 않는다. 만약 위치권한에 허용을 하지 않았을 경우에 날씨날씨에서 어떻게 하는지 연구 필요
      Future.error('등록되어있는 지역이 없어요. \n 지역을 등록해주세요.');
    }
  }
}

// class Announcement {
//   final String title;
//   final String body;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Announcement(this.title, this.body, this.createdAt, this.updatedAt);

//   static Announcement fromJson(Map<String, dynamic> json) {
//     try {
//       final title = json["title"] as String;
//       final body = json["body"] as String;
//       final createdAt = DateTime.parse(json["created_at"] as String);
//       final updatedAt = DateTime.parse(json["updated_at"] as String);

//       return Announcement(title, body, createdAt, updatedAt);
//     } catch (error, stackTrace) {
//       AppLogHelper.showJsonParsingError(
//           modelName: "Announcement",
//           errorMessage: error.toString(),
//           stackTracce: stackTrace);
//       throw Exception(error);
//     }
//   }

//   Map<String, dynamic> get toMap {
//     return {
//       "title": title,
//       "body": body,
//       "created_at": createdAt.toString(),
//       "updated_at": updatedAt.toString()
//     };
//   }
// }
