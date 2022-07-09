import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_forecast_model.dart';

class OpenWeatherMapAPIProvider {
  var client = http.Client();

  Future<WeatherForecastModel> fetchWeatherForecast(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '09c36f3b979b1751c473eb020965b2b2',
      "units": "metric",
      "lang": "ru"
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/forecast/', queryParameters);

    try {
      final response = await client.get(uri);
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return WeatherForecastModel.fromJSON(jsonResponse);
      } else {
        return WeatherForecastModel.fromError(
            response.statusCode.toString(), jsonResponse['message']);
      }
    } catch (e) {
      throw Exception("Failed to load weather forecast data");
    }
  }
}

