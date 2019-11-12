import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserId() async {
  var url =
      'https://my-json-server.typicode.com/brilliantDjaka/support_in_json_server/login';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  String id = data['data']['userId'];
  return id;
}

Future<String> getUserData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url =
      'https://my-json-server.typicode.com/brilliantDjaka/support_in_json_server/user';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  String id = data['data']['name'];
  return id;
}

Future<List> getKreatorByKategori(String kategori) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url =
      'https://my-json-server.typicode.com/brilliantDjaka/support_in_json_server/daftarKreator';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  List listKreator = data['data'].toList();
  return listKreator;
}

Future<Map> getKaryaListByKreatorId(String idKreator) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url =
      'https://my-json-server.typicode.com/brilliantDjaka/support_in_json_server/daftarKonten';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  Map kreatorData = data['data'];
  return kreatorData;
}
