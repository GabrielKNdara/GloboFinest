import 'package:http/http.dart' as http;
import 'dart:convert';
import '/data/weather.dart';

class HttpHelper{
  // https://api.openweathermap.org/data/2.5/weather?q=windhoek&appid=6c5b2741a403e4f7a51c9882f9898c45
  final String authority ='api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '6c5b2741a403e4f7a51c9882f9898c45';

  Future<Weather> getWeather(String location) async{
    Map<String, dynamic> parameters = {'q': location, 'appId':apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}