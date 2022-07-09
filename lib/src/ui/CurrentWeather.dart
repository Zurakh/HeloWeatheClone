import 'package:flutter/material.dart';

import '../blocs/current_bloc.dart';
import '../models/weather_model.dart';

class CurrentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: currentWeatherBloc.curWeather,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasData) {
                  return buildCurrent(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCurrent(AsyncSnapshot<WeatherModel> snapshot) {
    return Scaffold(
        body: Center(
          child: Column(children: [
      Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Text('Now'),
              Image.network(
                  'http://openweathermap.org/img/wn/${snapshot.data.weatherIcon}@2x.png'),
              Text(
                '${snapshot.data.temp}°',
                style: const TextStyle(fontSize: 30),
              ),
              Text('${snapshot.data.weatherDescription}'),
              Text('Влажность: ${snapshot.data.humidity}'),
              Text('Давление ${snapshot.data.pressure}'),
            ]))
    ]),
        ));
  }

}
