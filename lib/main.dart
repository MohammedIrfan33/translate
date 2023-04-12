import 'package:flutter/material.dart';
import 'package:translate/ui/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF0A0E21),
      scaffoldBackgroundColor:const Color(0xFF0A0E21),
      appBarTheme:const  AppBarTheme(
        color:  Color(0xFF000000)
      )
    ),
      home:HomeScreen(),
    );
  }
}

