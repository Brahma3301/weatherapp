import 'package:clima_weather_app/services/location.dart';
import 'package:clima_weather_app/services/networking.dart';

const APIkey = '443b1f2686d32f290dfadc644fa06d53';
const openWeathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
 
 
  Future<dynamic> getcityweather(String cityname) async{
    var url='$openWeathermapurl?q=$cityname&appid=$APIkey&units=metric';
    NetworkHelper networkhelper=NetworkHelper(url);
     var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }
 
 
  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();

    NetworkHelper networkhelper = NetworkHelper(
        '$openWeathermapurl?lat=${location.latitude}&lon=${location.longitude}&appid=$APIkey&units=metric');
    var weatherdata = await networkhelper.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
