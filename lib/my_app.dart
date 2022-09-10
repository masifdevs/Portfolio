import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/config/colors.dart';
import 'package:flutter_web_portfolio/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: AppColors.kRedColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
