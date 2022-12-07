import 'package:flutter/material.dart';

class LocationPermissionPage extends StatelessWidget {
  const LocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('위치정보 권한을 설정해 주세요.'),
      ),
    );
  }
}
