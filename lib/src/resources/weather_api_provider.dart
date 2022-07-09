import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_forecast_model.dart';

class OpenWeatherMapAPIProvider {

  var client = http.Client();

  Future<WeatherForecastModel> fetchWeatherForecast(String city) async {

    final queryParameters = {
      'q' : city,
      'appid' : '09c36f3b979b1751c473eb020965b2b2',
      "units" : "metric",
      "lang" : "ru"};

    final uri = Uri.https('api.openweathermap.org',
        'data/2.5/forecast/',
        queryParameters);

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
// //09c36f3b979b1751c473eb020965b2b2
// //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
// //api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}
//
// class DataService{
//   Future<FResponse> getWeather(String city) async{
//     final queryParameters = {
//       'q' : city,
//       'appid' : '09c36f3b979b1751c473eb020965b2b2',
//       "units" : "metric"};
//
//     final uri = Uri.https('api.openweathermap.org',
//         'data/2.5/forecast/',
//         queryParameters);
//
//     final response = await http.get(uri);
//     final json = jsonDecode(response.body);
//     return FResponse.fromJson(json);
//     //return WeatherResponse.fromJson(json);
//   }
//
// }