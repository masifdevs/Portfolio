import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/my_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(MyApp());
}
