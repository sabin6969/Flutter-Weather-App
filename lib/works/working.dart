import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherInfo {
  String? name;
  String? temperature;
  String? windSpeed;
  String? humidity;
  String? feelsLike;
  String? main;

  WeatherInfo({String? cityName}) {
    name = cityName;
  }
  Future<void> getData() async {
    var forTemperature;
    var forWindSpeed;
    var forHumidity;
    var forFeelsLike;
    var forMain;
    String yourapikey = "provideapikey";
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$yourapikey";
      dynamic response = await http.get(Uri.parse(url));
      Map mainData = jsonDecode(response.body);

      // getting temperature of that city
      forTemperature = mainData["main"];
      double tempInCelcius = (forTemperature["temp"] - 273.15);
      temperature = tempInCelcius.round().toString();

      // getting wind speed
      forWindSpeed = mainData["wind"];
      double windspeed = forWindSpeed["speed"];
      windSpeed = (windspeed * 3.6).toString();

      // for Humidity
      forHumidity = mainData["main"];
      humidity = forHumidity["humidity"].toString();

      // feels like
      forFeelsLike = mainData["main"];
      feelsLike = forFeelsLike["feels_like"].toString();

      // for main either cloud or haze or something else
      forMain = mainData["weather"][0];
      main = forMain["main"];
    } catch (e) {
      temperature = "Error";
      windSpeed = "Error";
      humidity = "Error";
      feelsLike = "Error";
      main = "Error";
    }
  }
}
