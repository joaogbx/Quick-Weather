import 'dart:ui';

import 'package:QuickWeather/controllers/city_search_controller.dart';
import 'package:QuickWeather/controllers/current_conditions_controller.dart';
import 'package:QuickWeather/controllers/hourly_forecast_controller.dart';
import 'package:QuickWeather/models/city_search.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePrimaryHeader extends StatefulWidget {
  const HomePrimaryHeader({super.key});

  @override
  State<HomePrimaryHeader> createState() => _HomePrimaryHeaderState();
}

class _HomePrimaryHeaderState extends State<HomePrimaryHeader> {
  final TextEditingController _textEditingController = TextEditingController();
  String cityName = 'Selecione uma localização';

  @override
  Widget build(BuildContext context) {
    final currentConditionsController =
        context.read<CurrentConditionsController>();
    final c = context.read<HourlyForecastController>();

    final citySearchController = context.read<CitySearchController>();

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30), // Removi o .h
      child: Row(
        children: [
          Spacer(),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent, // importante!
                isScrollControlled: true,
                builder: (context) {
                  List<City> cities =
                      context.watch<CitySearchController>().cities;
                  return Container(
                    height: (MediaQuery.of(context).size.height * 0.5) +
                        MediaQuery.of(context).viewInsets.bottom,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Form(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'QuikWeather',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: _textEditingController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              citySearchController.citySearch(
                                                  _textEditingController.text);
                                            },
                                            icon: const Icon(Icons.search)),
                                        hintText: 'Buscar cidade',
                                        hintStyle: const TextStyle(
                                            color: Colors.white70),
                                        filled: true,
                                        fillColor: Colors.white12,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      itemCount: cities.length,
                                      itemBuilder: (context, index) {
                                        final city = cities[index];
                                        final isFirst = index == 0;
                                        final isLast =
                                            index == cities.length - 1;

                                        return InkWell(
                                          onTap: () {
                                            cityName = city.name;
                                            currentConditionsController
                                                .currentConditions(city.key);
                                            c.hourlyForecast(city.key);
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  82, 117, 149, 163),
                                              borderRadius: BorderRadius.only(
                                                topLeft: isFirst
                                                    ? const Radius.circular(12)
                                                    : Radius.zero,
                                                topRight: isFirst
                                                    ? const Radius.circular(12)
                                                    : Radius.zero,
                                                bottomLeft: isLast
                                                    ? const Radius.circular(12)
                                                    : Radius.zero,
                                                bottomRight: isLast
                                                    ? const Radius.circular(12)
                                                    : Radius.zero,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                              leading: const Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.white),
                                              title: Text(
                                                city.name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              subtitle: Text(
                                                '${city.state}, ${city.country}',
                                                style: const TextStyle(
                                                    color: Colors.white70),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 17, // Medida fixa
                ),
                const SizedBox(width: 6), // Medida fixa
                Text(
                  cityName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Medida fixa
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
