import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final WeatherController _controller = WeatherController();
  final TextEditingController _cityController = TextEditingController();
  String? errorMessage;

  void _fetchWeather() async {
    final city = _cityController.text;
    if (city.isNotEmpty) {
      await _controller.getWeather(city);
      setState(() {
        if (_controller.weather == null) {
          errorMessage = "Couldn't fetch weather for $city";
        } else {
          errorMessage = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              )
            else if (_controller.weather != null)
              Column(
                children: [
                  Text(
                    'City: ${_controller.weather?.cityName}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Temperature: ${_controller.weather?.temperature}°C',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Description: ${_controller.weather?.description}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
