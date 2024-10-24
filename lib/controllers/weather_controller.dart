import '../models/weather_model.dart';

class WeatherController {
  WeatherModel? weather;

  Future<void> getWeather(String cityName) async {
    weather = await WeatherModel.fetchWeather(cityName);
  }
}
