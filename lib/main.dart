import 'package:flutter/material.dart';

import 'package:newsfeed/Screens/buffer.dart';
import 'package:newsfeed/Screens/countrylist.dart';
import 'package:newsfeed/Screens/newsarticle.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Buffer(),
        '/home': (context) => const Home(),
        '/countrylist': (context) => const CountryList(),
        '/newsarticle': (context) => NewsArticle(),
      },
    );
  }
}
