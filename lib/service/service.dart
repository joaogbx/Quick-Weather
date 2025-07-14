import 'dart:convert';

import 'package:QuickWeather/service/api_constans.dart';
import 'package:dio/dio.dart';

class Service {
  final Dio _dio = Dio();

  Future<Response> currentConditions(String cityKey) async {
    try {
      final url = ApiConstans.currentConditions(cityKey);

      final response = await _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> citySearch(String cityName) async {
    try {
      final url = ApiConstans.citySearch(cityName);

      final response = await _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> hourlyForecast(String cityKey) async {
    try {
      final url = ApiConstans.hourlyForecast(cityKey);
      final response = _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
