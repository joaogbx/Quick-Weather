import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstans {
  static final String apiKey = dotenv.env['API_KEY'] ?? '';
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static String citySearch(String cityName) =>
      '$baseUrl/locations/v1/cities/search?apikey=$apiKey&q=$cityName';

  static String currentConditions(String cityKey) =>
      '$baseUrl/currentconditions/v1/$cityKey?apikey=$apiKey&language=pt-br&details=true';

  static String hourlyForecast(String cityKey) =>
      '$baseUrl/forecasts/v1/hourly/12hour/$cityKey?apikey=Mf0WPaKl6JoG5btgdRJWfdqdBxXLxDlj&metric=true';
}
