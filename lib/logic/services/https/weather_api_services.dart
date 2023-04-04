import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/data/constants/constants.dart';
import 'package:weather_app/logic/services/exceptions/weather_exception.dart';

import '../../../data/models/weather.dart';

class WeatherApiServices {
  final Client client;

  WeatherApiServices({required this.client});

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(
        '$baseUrl?q=${city.toLowerCase()}&units=metric&&appid=$apiKey');

    try {
      final response = await client.get(url);

      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      final responseBody = jsonDecode(response.body);

      if (responseBody == null) {
        throw WeatherException('Cannot get weather for $city');
      }

      final data = responseBody as Map<String, dynamic>;
      final weatherData = data['weather'][0];
      final mainData = data['main'];

      final Weather weather = Weather(
        id: weatherData['id'].toString(),
        main: weatherData['main'],
        description: weatherData['description'],
        icon: weatherData['icon'],
        city: city,
        temperature: double.parse(mainData['temp'].toString()),
      );

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
