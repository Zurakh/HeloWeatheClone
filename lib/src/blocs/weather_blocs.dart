import '../models/weather_forecast_model.dart';
import '../resources/repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class WeatherForecastBloc {
  final _repository = Repository();
  final _weatherFetcher = PublishSubject<WeatherForecastModel>();

  Observable<WeatherForecastModel> get allWeather => _weatherFetcher.stream;

  fetchAllWeather(String requestURL) async {
    WeatherForecastModel itemModel =
        await _repository.fetchWeatherForecast(requestURL);
    _weatherFetcher.sink.add(itemModel);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

final weatherForecastBloc = WeatherForecastBloc();
