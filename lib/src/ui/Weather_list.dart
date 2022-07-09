import 'package:flutter/material.dart';
import 'package:medtut/src/models/weather_forecast_model.dart';

import '../blocs/weather_blocs.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // weatherForecastBloc.fetchAllWeather("omsk");
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Forecast'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: weatherForecastBloc.allWeather,
              builder: (context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return buildList(snapshot);
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

  Widget buildList(AsyncSnapshot<WeatherForecastModel> snapshot) {
    return ListView.builder(
        padding: const EdgeInsets.all(50),
        itemCount: snapshot.data.weatherList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text('${snapshot.data.weatherList[index].dtTxt}'),
                Image.network(
                    'http://openweathermap.org/img/wn/${snapshot.data.weatherList[index].weatherIcon}@2x.png'),
                Text(
                  '${snapshot.data.weatherList[index].temp}°',
                  style: TextStyle(fontSize: 20),
                ),
                Text('${snapshot.data.weatherList[index].weatherDescription}'),
                Text('Влажность: ${snapshot.data.weatherList[index].humidity}'),
                Text('Давление ${snapshot.data.weatherList[index].pressure}'),
              ],
            ),
          );
        });
  }
}
