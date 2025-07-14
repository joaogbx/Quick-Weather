import 'dart:developer';

import 'package:QuickWeather/models/city_search.dart';
import 'package:flutter/material.dart';

import 'package:QuickWeather/service/service.dart';

class CitySearchController extends ChangeNotifier {
  final Service service = Service();
  List<City> cities = [];

  citySearch(String cityName) async {
    final response = await service.citySearch(cityName);
    final newCities = (response.data as List)
        .map((element) => City.fromJson(element))
        .toList();

    cities = newCities;
    notifyListeners();
  }
}
