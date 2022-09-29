import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app_flutter/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark)),
      home: HomeScreen(),
    );
  }
}
