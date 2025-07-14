import 'package:QuickWeather/models/hourly_forecast.dart';
import 'package:QuickWeather/service/service.dart';
import 'package:flutter/material.dart';

class HourlyForecastController extends ChangeNotifier {
  final Service _service = Service();

  List<HourlyForecast> listHourlyForecast = [];

  hourlyForecast(String cityKey) async {
    final response = await _service.hourlyForecast(cityKey);

    if (response.statusCode == 200) {
      listHourlyForecast = (response.data as List)
          .map((element) => HourlyForecast.fromJson(element))
          .toList();
    }
    notifyListeners();
  }
}
