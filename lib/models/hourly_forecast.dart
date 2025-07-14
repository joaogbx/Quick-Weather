class HourlyForecast {
  final double temperature;
  final String weatherIconId;
  final DateTime hour;

  HourlyForecast({
    required this.temperature,
    required this.weatherIconId,
    required this.hour,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      temperature: (json['Temperature']['Value'] as num).toDouble(),
      hour: DateTime.parse(json['DateTime']),
      weatherIconId: mapIcon(json['WeatherIcon']),
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
