import 'package:flutter/material.dart';
import 'package:support_in/pages/daftar_support.dart';
import 'package:support_in/pages/login.dart';
import 'package:support_in/pages/tukar_point.dart';
import './pages/home.dart';
import './pages/un_login.dart';
import './pages/daftar_kreator.dart';
import './pages/daftar_karya.dart';
import './pages/deskripsi_karya.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support_in/pages/register.dart';

void main() async {
  bool loggedIn = false;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(sharedPreferences.get('idUser'));
  if (sharedPreferences.get('idUser') != null) {
    loggedIn = true;
  }
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xff2A4AC2),
      accentColor: Color(0xffF2F2F2),
      backgroundColor: Color(0xffFFFFFF),
      textTheme: TextTheme(
          title: TextStyle(
              color: Color(0xff2A4AC2),
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito Sans',
              fontSize: 24
          ),

          caption: TextStyle(color: Color(0xff7C7474))),
    ),
    title: 'support.in',
    initialRoute: loggedIn ? '/' : '/unlogin',
    routes: {
      '/unlogin': (context) => UnLogin(),
      '/': (context) => Home(),
      '/daftar-kreator': (context) => DaftarKreator(),
      '/daftar-karya': (context) => DaftarKarya(),
      '/deskripsi-karya': (context) => DeskripsiKarya(),
      '/daftar-support': (context) => DaftarSupport(),
      '/tukar-point': (context) => TukarPoint(),
      '/register': (context) => Register(),
      '/login': (context) => Login(),
    },
  ));
}
