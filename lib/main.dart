import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {

        '/': (context) => const HomePage(),
      }
  ));
}
