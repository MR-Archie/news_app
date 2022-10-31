import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/home_page.dart';

import './screens/descriptions.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
