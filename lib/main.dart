import 'package:flutter/material.dart';

import './screens/home_page.dart';

import './screens/descriptions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News_App',
      theme: ThemeData(
          primarySwatch: Colors.indigo, secondaryHeaderColor: Colors.teal),
      home: HomePage(),
      routes: {
        '/description': (context) => Description(),
      },
    );
  }
}
