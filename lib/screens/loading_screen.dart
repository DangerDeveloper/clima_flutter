import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const apiKey = 'a4836966ddadb5328e14f5eff350dc11';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitudes;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitudes = location.latitudes;
    longitude = location.longitude;
  }

  void getData() async {
    var response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitudes&lon=$longitude&appid=$apiKey');

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = convert.jsonDecode(data);

      print(decodeData['coord']['lon']);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(),
    );
  }
}
