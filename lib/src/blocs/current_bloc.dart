import 'package:medtut/src/models/weather_model.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class CurrentWeatherBloc {
  final _repository = Repository();
  final _weatherFetcher = PublishSubject<WeatherModel>();

  Observable<WeatherModel> get curWeather => _weatherFetcher.stream;

  fetchCurrentWeather(String requestURL) async {
    WeatherModel itemModel =
    await _repository.fetchCurrentWeather(requestURL);
    _weatherFetcher.sink.add(itemModel);
  }

  dispose() {
    _weatherFetcher.close();
  }
}

final currentWeatherBloc = CurrentWeatherBloc();
