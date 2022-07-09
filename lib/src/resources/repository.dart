import 'package:medtut/src/resources/weather_api_provider.dart';
import '../models/weather_forecast_model.dart';
import '../models/weather_model.dart';

class Repository {
  final openWeatherMapAPIProvider = OpenWeatherMapAPIProvider();

  Future<WeatherForecastModel> fetchWeatherForecast(String requestURL) =>
      openWeatherMapAPIProvider.fetchWeatherForecast(requestURL);

  Future<WeatherModel> fetchCurrentWeather(String requestURL) =>
    openWeatherMapAPIProvider.fetchCurrentWeather(requestURL);
}
