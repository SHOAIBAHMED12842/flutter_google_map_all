import 'package:flutter/material.dart';
import 'package:google_map_all/convert_latlang_to_address.dart';
import 'package:google_map_all/current_location.dart';
import 'package:google_map_all/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOOGLE MAP TUTORIAL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrentLocationScreen()
      //ConvertLatLangToAddress(),
      //MyHomePage(),
    );
  }
}

