import 'package:facebook_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Constants.scaffold,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: NavScreen(),
    );
  }
}
