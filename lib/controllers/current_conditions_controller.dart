import 'package:QuickWeather/models/current_condition.dart';
import 'package:QuickWeather/service/service.dart';
import 'package:flutter/material.dart';

class CurrentConditionsController extends ChangeNotifier {
  final Service _service = Service();
  CurrentCondition? _currentCondition;
  CurrentCondition? get currentCondition => _currentCondition;

  currentConditions(String cityKey) async {
    final response = await _service.currentConditions(cityKey);
    _currentCondition =
        CurrentCondition.fromJson((response.data as List).first);
    notifyListeners();
  }
}
