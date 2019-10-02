import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'support.in',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
    },
  ));
}
