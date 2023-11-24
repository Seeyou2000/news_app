import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';

void main() =>
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {

      '/': (context) => HomePage(),
    }
  ));
