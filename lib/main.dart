import 'package:flutter/material.dart';
import 'views/weather_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherView(),
    );
  }
}
