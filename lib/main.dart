import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xff9C72E1),
        accentColor: Color(0xffFFFFFF),
        backgroundColor: Color(0xffFFFFFF),
        textTheme: TextTheme(
            title: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 15,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w300
            )
        )
    ),
    title: 'support.in',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}
