class CurrentCondition {
  final String weatherText;
  final String weatherIconId;
  final double temperature;
  final double? relativeHumidity;
  final double? windSpeedKmh;

  CurrentCondition({
    required this.weatherText,
    required this.weatherIconId,
    required this.temperature,
    required this.relativeHumidity,
    required this.windSpeedKmh,
  });

  factory CurrentCondition.fromJson(Map<String, dynamic> json) {
    return CurrentCondition(
      weatherText: json['WeatherText'],
      weatherIconId: mapIcon(json['WeatherIcon']),
      temperature: (json['Temperature']['Metric']['Value'] as num).toDouble(),
      relativeHumidity: (json['RelativeHumidity'] as num).toDouble(),
      windSpeedKmh:
          (json['Wind']['Speed']['Metric']['Value'] as num).toDouble(),
    );
  }

  static String mapIcon(int weatherIcon) {
    switch (weatherIcon) {
      case 1:
      case 2:
      case 33:
      case 34:
        return '01d'; // Sol e tempo claro

      case 3:
      case 4:
      case 21:
      case 35:
      case 36:
        return '02d'; // Parcialmente ensolarado, nuvem e sol

      case 5:
      case 37:
        return '6'; // Sol com pouca nuvem (hazy sunshine)

      case 6:
      case 7:
      case 8:
      case 20:
      case 30:
      case 31:
      case 32:
      case 38:
      case 43:
        return '04d'; // Nublado só nuvem

      case 11:
        return '6'; // Nevoeiro (sol com pouca nuvem)

      case 12:
      case 18:
      case 39:
      case 40:
        return '7'; // Nuvem com leve chuva

      case 13:
      case 14:
        return '10d'; // Nuvem com chuva e sol

      case 15:
      case 16:
      case 17:
      case 19:
      case 41:
      case 42:
        return '50d'; // Nuvem com raio (tempestade)

      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 29:
      case 44:
        return '7'; // Neve ou chuva congelada - usando nuvem com leve chuva para simplificar

      default:
        return '04d'; // Caso padrão: nublado só nuvem
    }
  }
}
