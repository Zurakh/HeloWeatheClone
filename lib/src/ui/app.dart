import 'package:flutter/material.dart';
import 'package:medtut/src/ui/Weather_list.dart';

import '../blocs/weather_blocs.dart';
import '../blocs/current_bloc.dart';
import 'CurrentWeather.dart';

class App extends StatelessWidget {
  final _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search')),
              Flexible(flex: 2, child: CurrentWeather()),
              Expanded(flex: 3, child: WeatherList())
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    weatherForecastBloc.fetchAllWeather(_cityTextController.text);
    currentWeatherBloc.fetchCurrentWeather(_cityTextController.text);
  }
}
