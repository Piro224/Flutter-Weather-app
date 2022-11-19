// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';

import'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData{


  Future<Weather> getData(var latitude, var longitude) async{
    var uricall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=929c94353f074d08802180052221711&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
}
}