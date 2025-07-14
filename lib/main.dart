import 'package:QuickWeather/controllers/city_search_controller.dart';
import 'package:QuickWeather/controllers/current_conditions_controller.dart';
import 'package:QuickWeather/controllers/hourly_forecast_controller.dart';
import 'package:QuickWeather/view/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CitySearchController(),
      ),
      ChangeNotifierProvider(
        create: (_) => CurrentConditionsController(),
      ),
      ChangeNotifierProvider(
        create: (_) => HourlyForecastController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
