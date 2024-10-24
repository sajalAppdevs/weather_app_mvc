import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  static Future<WeatherModel?> fetchWeather(String cityName) async {
    final apiKey = 'YOUR_API_KEY'; // Replace with your OpenWeatherMap API key
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel(
          cityName: data['name'],
          temperature: data['main']['temp'],
          description: data['weather'][0]['description'],
        );
      } else {
        print('Failed to load weather data');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
