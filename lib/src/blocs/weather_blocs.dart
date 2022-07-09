import '../models/weather_forecast_model.dart';
import '../resources/repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class WeatherForecastBloc {
//   final _repository = Repository();
//   PublishSubject<WeatherForecastModel> _weatherForecastFetcher =
//   PublishSubject<WeatherForecastModel>();
//
//   Stream<WeatherForecastModel> get weatherForecast {
//     if (_weatherForecastFetcher.isClosed) {
//       _weatherForecastFetcher = PublishSubject<WeatherForecastModel>();
//     }
//     return _weatherForecastFetcher.stream;
//   }
//
//   fetchWeatherForecast(String requestURL) async {
//     WeatherForecastModel weatherForecastModel =
//     await _repository.fetchWeatherForecast(requestURL);
//     _weatherForecastFetcher.sink.add(weatherForecastModel);
//   }
//
//   dispose() async {
//     _weatherForecastFetcher.close();
//   }
// }
//
// class PublishSubject {
//   get sink => null;

  final _repository = Repository();
  final _weatherFetcher = PublishSubject<WeatherForecastModel>();

  Observable<WeatherForecastModel> get allWeather => _weatherFetcher.stream;

  fetchAllWeather(String requestURL) async {
    WeatherForecastModel itemModel = await _repository.fetchWeatherForecast(requestURL);
    _weatherFetcher.sink.add(itemModel);
  }

  dispose() {
    _weatherFetcher.close();
  }


}

final weatherForecastBloc = WeatherForecastBloc();


