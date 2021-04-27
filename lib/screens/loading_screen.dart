import 'package:flutter/material.dart';

import 'package:http/http.dart 'as http;


import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

 class _LoadingScreenState extends State<LoadingScreen> {
 @override
  void initState() {
   super.initState();
   getLocation();
  }
 void getLocation() async {
   Location location = Location();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);
   }
  Future<void> getData() async {
   var response;
    var url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=a9c513d81e3964d4321947dbadab2148');
    try {
       response = await http.get(url);
       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');
    }catch(e) {
      print(e);
    }
    }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }

  }

