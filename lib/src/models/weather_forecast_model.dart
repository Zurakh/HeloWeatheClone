import 'package:medtut/src/models/weather_model.dart';

class WeatherForecastModel {
  String _cod;
  int _cnt;
  List<WeatherModel> _weatherList;
  String _country;
  String _name;
  int _timeZone;
  String _error;

  String get cod => _cod;

  int get cnt => _cnt;

  List<WeatherModel> get weatherList => _weatherList;

  String get country => _country;

  String get name => _name;

  int get timeZone => _timeZone;

  String get error => _error;

  WeatherForecastModel.fromJSON(Map<String, dynamic> parsedJSON) {
    _cod = parsedJSON['cod'].toString();
    _cnt = parsedJSON['cnt'];
    _timeZone = parsedJSON['city']['timezone'];
    _weatherList = [];

    for (int i = 0; i < 40; ++i) {
      //Надо попробовать просто добавить в список
      //WeatherModel(parsedJSON)

      //WeatherModel weatherModel = WeatherModel.fromJSON(parsedJSON);

      WeatherModel weatherModel = WeatherModel();

      print(parsedJSON.values);
      print(parsedJSON['list'][i]['dt']);
      print(parsedJSON['list'][i]['dt_txt']);
      print(parsedJSON['list'][i]['main']['temp'].round().toString());
      print(parsedJSON['list'][i]['weather'][0]['icon']);
      print(_timeZone);
      print(parsedJSON['list'][i]['main']['pressure'].toString());
      print(parsedJSON['list'][i]['main']['humidity'].toString());
      print(parsedJSON['list'][i]['weather'][0]['main']);
      print(parsedJSON['list'][i]['weather'][0]['description']);
      print(parsedJSON['list'][i]['weather'][0]['icon']);

      weatherModel.dt = parsedJSON['list'][i]['dt'];
      weatherModel.dtTxt = parsedJSON['list'][i]['dt_txt'];
      weatherModel.temp =
          parsedJSON['list'][i]['main']['temp'].round().toString();
      weatherModel.weatherIcon = parsedJSON['list'][i]['weather'][0]['icon'];
      weatherModel.timeZone = _timeZone;
      weatherModel.pressure =
          parsedJSON['list'][i]['main']['pressure'].toString();
      weatherModel.humidity =
          parsedJSON['list'][i]['main']['humidity'].toString();
      weatherModel.weatherMain = parsedJSON['list'][i]['weather'][0]['main'];
      weatherModel.weatherDescription =
          parsedJSON['list'][i]['weather'][0]['description'];

      _weatherList.add(weatherModel);
    }
  }

  WeatherForecastModel.fromError(String cod, String error) {
    _cod = cod;
    _error = error;
  }
}
