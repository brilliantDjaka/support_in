import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String host = 'https://support-in.herokuapp.com';

helperJson(String key, dynamic data) {
  if (data == null) {
    switch (data[key].runtimeType) {
      case int:
        return 0;
        break;
      case String:
        return '';
        break;
      case List:
        return [].toList();
        break;
      case Iterable:
        return [];
        break;
    }
  } else
    return data;
}

Future<bool> register({String name = '',
  @required String email,
  @required String password}) async {
  var url = host + '/api/penyumbang/register';
  Map<String, String> headers = {"Content-type": "application/json"};
  http.Response response = await http.post(url,
      headers: headers,
      body: json.encode({"name": name, "email": email, "password": password}));

  Map data = json.decode(response.body);
  if (data['code'] == 200)
    return true;
  else
    return false;
}

Future<Map> login({@required String email, @required String password}) async {
  var url = host + '/api/penyumbang/login';
  Map<String, String> headers = {"Content-type": "application/json"};
  http.Response response = await http.post(url,
      headers: headers,
      body: json.encode({"email": email, "password": password}));

  Map data = json.decode(response.body);
  if (data['code'] == 200)
    return {"success": true, "_id": data['data']['_id']};
  else
    return {"success": false};
}

///////////////////////////////////////////////////////////////////////////////

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
  var url = host + '/api/kreator';
  Map<String, String> headers = {"Content-type": "application/json"};
  http.Response response = await http.post(url, body: json.encode({
    "category": kategori
  }),
      headers: headers);
  Map data = json.decode(response.body);
  List listKreator = data['data']
      .map((e) =>
  ({
    "idKreator": e['_id'],
    "nama": e['name'],
    "skor": e['rating'],
    "jumlahKarya": e['totalContent'],
    "urlImage": ''
  }))
      .toList();

  return listKreator;
}

Future<List> searchKreator(String kategori, String name) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = host + '/api/kreator/cari';
  Map<String, String> headers = {"Content-type": "application/json"};
  http.Response response = await http.post(url, body: json.encode({
    "category": kategori,
    "name": name
  }),
      headers: headers);
  Map data = json.decode(response.body);
  print(data);
  List listKreator = data['data']
      .map((e) =>
  ({
    "idKreator": e['_id'],
    "nama": e['name'],
    "skor": e['rating'],
    "jumlahKarya": e['totalContent'] == null ? 0 : e['totalContent'],
    "urlImage": ''
  }))
      .toList();

  return listKreator;
}

Future<Map> getKaryaListByKreatorId(String idKreator) async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = host + '/api/kreator/$idKreator';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  if (data["code"] != 200) throw Error();
  data = data['data'];

  List konten = data['content'].map((f) {
    return {
      "judulKarya": f['title'],
      "imageUrl": f['pictureUrl'],
      "rating": f['rating'],
      "deskripsi": f['description'],
      "idKarya": f['_id']
    };
  }).toList();
  Map kreatorData = {
    "namaKreator": data['name'],
    "picUrl": "https://i.ibb.co/ftCGn4H/circle-cropped.png",
    "kategori": "Unimplement",
    "point": 100,
    "jumlahKarya": data['content'].length,
    "karya": konten
  };
  return kreatorData;
}

Future<Map> getSpecificKarya(String idKreator, String idKarya) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = host + '/api/karya/$idKreator/$idKarya';
  http.Response response = await http.get(url);
  Map data = json.decode(response.body);
  if (data['code'] != 200) throw Error();
  data = data['data']['content'][0];
  Map kreatorData = {
    "namaKarya": data['name'],
    "rating": '0',
    "picUrl":
    data['pictureUrl'],
    "deskripsi":
    data['description'],
  };
  await Future.delayed(Duration(seconds: 1));
  return kreatorData;
}

Future<List> getTukarPoinData(String idKreator) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(idKreator);
  var url = host + '/api/reward/$idKreator';
  http.Response response = await http.get(url);

  Map data = json.decode(response.body);

  if (data['code'] != 200) throw Error();
  List result = data['data'];
  result = result.map((f) =>
  ({
    "picUrl": f['foto_reward'] == null
        ? 'https://images.solopos.com/2013/01/piala.jpg'
        : f['foto_reward'],
    "title": f['nama_reward'],
    "poin": f['harga_pts'],
    'link': f['link_reward']
  })).toList();
  return result;
}

Future<bool> tukarPoin(String idPoint) async {
  var url = host + '/api/reward/';
  http.Response response = await http.get(url);

  Map data = json.decode(response.body);

  if (data['code'] != 200) throw Error();
  List result = data['data'];
  result = result.map((f) =>
  ({
    "picUrl": f['foto_reward'] == null
        ? 'https://images.solopos.com/2013/01/piala.jpg'
        : f['foto_reward'],
    "title": f['nama_reward'],
    "poin": f['harga_pts'],
    'link': f['link_reward']
  })).toList();
  return false;
}