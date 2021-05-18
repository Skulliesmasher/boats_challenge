import 'package:boats_challenge/ui/boat_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 32,
            color: Colors.grey[800],
          ),
          bodyText2: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: BoatListPage(),
    );
  }
}
