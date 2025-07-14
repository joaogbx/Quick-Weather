import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final DateTime hour;
  final double temperature;
  final String icon;
  const WeatherBox(
      {super.key,
      required this.hour,
      required this.temperature,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 15, bottom: 15),
      child: Container(
        width: 65,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 204, 204, 204),
            width: 0.7,
          ),
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${temperature.round()}º',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
              Spacer(),
              SizedBox(
                height: 30,
                child: Image.asset("assets/icons/$icon.png"),
              ),
              Spacer(),
              Text(
                '${hour.hour}:${hour.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
