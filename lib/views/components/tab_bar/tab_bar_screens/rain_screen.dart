import 'package:flutter/material.dart';

class RainScreen extends StatelessWidget {
  const RainScreen({super.key});
  // final LocationController weatherController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '강수',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
