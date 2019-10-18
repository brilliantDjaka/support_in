import 'package:flutter/material.dart';
import 'package:support_in/pages/daftar_support.dart';
import './pages/home.dart';
import './pages/login.dart';
import './pages/daftar_kreator.dart';
import './pages/daftar_karya.dart';
import './pages/deskripsi_karya.dart';
void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff9C72E1),
          accentColor: Color(0xff7C7474),
          backgroundColor: Color(0xffFFFFFF),
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 15,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w300),
              caption: TextStyle(
                  color: Color(0xff7C7474)
              )),
    ),
    title: 'support.in',
        initialRoute: '/login',
    routes: {
      '/': (context) => Home(),
      '/login': (context) => Login(),
      '/daftar-kreator': (context) => DaftarKreator(),
      '/daftar-karya': (context) => DaftarKarya(),
      '/deskripsi-karya': (context) => DeskripsiKarya(),
      '/daftar-support': (context) => DaftarSupport(),
    },
  ));
}
