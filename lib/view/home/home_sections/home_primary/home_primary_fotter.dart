import 'package:QuickWeather/controllers/hourly_forecast_controller.dart';
import 'package:QuickWeather/models/hourly_forecast.dart';
import 'package:QuickWeather/view/home/home_widgets/weather_box.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePrimaryFotter extends StatelessWidget {
  const HomePrimaryFotter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HourlyForecastController>();

    final List<HourlyForecast> listForecast = controller.listHourlyForecast;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Hoje',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.125,
            constraints: BoxConstraints(minHeight: 100),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listForecast.length,
              itemBuilder: (context, index) {
                return WeatherBox(
                  temperature: listForecast[index].temperature,
                  hour: listForecast[index].hour,
                  icon: listForecast[index].weatherIconId,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
