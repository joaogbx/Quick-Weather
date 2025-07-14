import 'package:QuickWeather/controllers/current_conditions_controller.dart';
import 'package:QuickWeather/models/current_condition.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePrimaryBody extends StatelessWidget {
  const HomePrimaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CurrentConditionsController>();
    final CurrentCondition? currentCondition = controller.currentCondition;
    return currentCondition != null
        ? Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      color: const Color.fromARGB(0, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(143, 255, 255, 255),
                            spreadRadius: 2,
                            blurRadius: 50),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/icons/${currentCondition.weatherIconId}.png",
                      width: 550, // fixo
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Transform.translate(
                offset: Offset(10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentCondition.temperature.round().toString(),
                      style: TextStyle(
                        height: 0.8,
                        fontSize: 130,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text(
                        '°',
                        style: TextStyle(
                          height: 0.8,
                          fontSize: 50,
                          color: const Color.fromARGB(173, 255, 255, 255),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentCondition.weatherText,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Segunda, 9 de jun',
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Divider(
                  thickness: 0.2,
                  color: const Color.fromARGB(186, 255, 255, 255),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Icon(Icons.air, color: Colors.white),
                      Text(
                        '${currentCondition.windSpeedKmh.toString()} km/h',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text(
                        'Vento',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Icon(Icons.water_drop, color: Colors.white),
                      Text(
                        '${currentCondition.relativeHumidity.toString()}%',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      Text(
                        'Umidade',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      )
                    ],
                  ),
                  Spacer()
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
