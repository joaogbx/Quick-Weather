import 'package:flutter/material.dart';

class WeatherBoxSelected extends StatelessWidget {
  const WeatherBoxSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 105,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(127, 100, 212, 246),
            blurRadius: 9,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 100, 212, 246),
            Color.fromARGB(255, 78, 198, 224),
            Color.fromARGB(255, 38, 159, 196),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('23°',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20)),
            Spacer(),
            SizedBox(
              height: 35,
              child: Image.asset("assets/icons/11d.png"),
            ),
            Spacer(),
            Text(
              '10:00',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w300,
                  fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
