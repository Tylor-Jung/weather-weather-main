import 'package:flutter/material.dart';

class HourlyTempWidget extends StatelessWidget {
  const HourlyTempWidget(
      {super.key,
      required this.time,
      required this.weatherImage,
      required this.temp});

  final String time;
  final String weatherImage;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 150,
        // height: 220,

        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            // SizedBox(
            //   height: 70,
            //   width: 70,
            //   child: Image.asset(
            //     weatherImage,
            //   ),
            // ),
            const SizedBox(height: 10),
            Text(
              temp,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
