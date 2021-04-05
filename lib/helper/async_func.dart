import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String host = 'https://support-in.herokuapp.com';

List dummyNama=['Cinta Brontosaurus','Koala Kumal','Kambing Jantan','Manusia Setengah Salmon','Marmut Merah Jambu'
'Tentang Kamu','Bintang','Matahari','Bidadari-Bidadari Surga','Negeri Para Bedebah','Daun yang Jatuh Tak Pernah Membenci Angin'];

List dummyLink =['https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTLl9CE2-zwWcqRyt1_5Bm9FQO4Dk1DcQzv-5wy4Bp2PK9EYawY',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHEv_FflIg3KAcIqosMxScGR7bzZS1C3VQbbtd8Dd5EII0LJOq',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRYcBWJqWYSaT4Lz1nHC5MoZjlwKnUSp7HOZGLAXwYT7kE-z4OE',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRYcBWJqWYSaT4Lz1nHC5MoZjlwKnUSp7HOZGLAXwYT7kE-z4OE',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR8uN_Cs0HS1A3B1rsu3Zgts0POFMvYdmAItsxK17y--tPizYTi',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQdRrRfh8uv_MaK9m65kyBcW59oFFW2ofQw9EhvXzXdo_oExhqF',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBfY5zlXV7PBRvg12kJl__EBv4w2TlA7OLiUjov5nHsRc-Sd6D',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8V7wv0yFQ_jBU7ZCj_HsIAUZKzV8NYCXGTve0CHbtvyBfaLw1',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRC5qd1KFmKC7Xv60222BOb55tTuyewrLMBZqKsjIA3q2Sfy8a4',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLBNrVslZN59HngKBSKAPB8p2gFcCJC0ghpTvE23Hp6r17zbev',
'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcKWZyrk28igp9GxrORQXj04zEneiTDqk0pVdx27eh8k_dItZ9',
];

List dummyDesc = [
  'Banyak cerita menarik yang ada pada buku Raditya Dika ini, mulai dari kisah cintanya saat SD hingga kisah cinta antara kucing kampung dengan kucing persia. Ia juga mengekspos keabnormalan dari para anggota keluarganya dalam buku ini. Kemudian novel ini diangkat ke layar lebat tepatnya pada tahun 2013 dengan menggunakan judul yang sama. Kali ini Radit berperan sebagai tokoh utamanya dibantu dengan Eriska Rein, Bucek Depp, Eriska Rein, Dewi Irawan, Tyas Mirasih, dan Soleh Solihun.',
  'Buku yang terdiri dari 247 halaman ini terbit pertama kali pada tahun 2015. Bercerita tentang seseorang yang barus saja mengalami patah hati. Namun ia tidak menyerah dan tidak menganggap hal tersebut sebagai akhir dari perjuangan cinta. Melainkan cinta itu butuh perjuangan yang dapat dilakukan dengan selalu menjaga semua aspeknya agar selalu tetap merasa nyaman. Buku yang diangkat ke perfilman pada tahun 2016 ini diperankan langsung oleh Radit dan berhasil meraih 1., juta tontonan.',
  'Kambing jantan adalah novel karya Radit yang berisi kisah seorang pelajar Indonesia yang menuntut ilmi di Australia. Ada banyak hal lucu dan konyol yang dituangkan ke dalam bentuk cerita sehari-hari kedalam buku setebal 237 halaman. Buku ini cukup laris manis dan masuk ke dalam best seller. Kemudian pada tahun 2009, novel ini pun difilmkan dengan dibintangi Radit dan dibantu oleh pemeran lain seperti Herfiza Novianti, Sarah Shafitri',
  'Buku yang terdiri dari 19 cerita ini menonjolkan cerita kehidupan sosial seorang Radit yang dibumbui banyak unsur humor. Banyak hal yang diulas dalam buku Raditya Dika ini, mulai dari saat Dika putus cinta hingga ketika dia menghibur diri Belnda. Kemudian buku ini diangkat ke layar lebar pada tahun 2013 dengan dibintangi oleh Radit, Kimberly Ryder, Dewi Irawan, Bucek Depp, Eriska Rein, hingga Soleh Solihun',
  'Buku Raditya Dika ini menceritakan soal kisah asmara Radit yang paling konyol. Mulai dari kisah SMP, cinta diam-ciam, cinta yang tidak disengaja, cinta sepihak, hingga ketika ia ditaksir oleh wanita kembar. Buku ini sukses difilmkan tepatnya pada tahun 2014. Christoffer Nelwan berperan sebagai Radit ketika SMP dan diisi oleh pemeran lainnya seperti Sonya Pandarmawan, Franda, Tio Pakusadewo, Jajang C Noer, hingga Raditya Dika sendiri.',
  'Novel ini menceritakan tentang perjalanan hidup seseorang wanita yang berasal dari keluarga miskin di sebuah pulau terpencil, Sumbawa Nusa Tenggara Barat. Novel ini masuk ke dalam salah satu buku best seller yang berhasil diterbitkan oleh seorang Tere Liye. Novel yang terbit Oktober 2016 ini memperoleh peringkat yang tinggi di Goodreads yakni 4,51.',
  'Novel satu ini menjadi serial Bumi ke-4 karya Tere yang diterbitkan pada tahun 2017. Novel bintang mengisahkan tentang petualangan 3 remaja SMA yang memiliki keingintahuan sangat tinggi. Adapun remaja-remaja tersebut yaitu Raib, Seli, dan Ali yang berpetualangan dalam dunia paralel yang tidak banyak diketahui orang. Novel ini merupakan novel fantasi yang pernah dibuat seorang Ter Liye',
  'Novel satu ini masih ada kaitannya dengan novel sebelumnya di mana novel matahari juga merupakan bagian dari serial novel Bumi. Novel yang satu ini hanya berkisah tentang Sosok Ali yang merupakan pelajar 15 tahun kelas X SMA. Di Goodreads, novel dengan tebal 400 halaman ini mendapatkan skor 4,3.',
  'Novel satu ini mengisahkan tentang pengorbanan seorang kakak bernama Laisa untuk adik-adiknya (Wibisana, Dalimunte, Ikanuri, dan Yashinta) di Lembah Lahambay supaya adik-adiknya bisa melanjutkan pendidikan. Novel yang terbit pada tahun 2008 ini peringkat 4,3 di Goodreads',
  'Isinya berupa sindiran-sindiran terhadap oknum pejabat yang kotor, mengisahkan tentang konsultan keuangan senior yang super sibuk. Novel yang mempunyai tebal 440 halaman ini pertama kali diterbitkan pada tahun 2012 oleh PT Gramedia Pustaka Utama.',
  'Novel ini berkisah tentang dua orang yang saling mencintai tak bisa mengungkapkan lalu memutuskan untuk memendam perasaannya. Namun pada akhirnya kedua tokoh ini bertemu. Diterbitkan pertama kali pada tahun 2010, Tere Liye mengambil tema “cinta tak harus memiliki” seperti yang dirasakan remaja sekarang.',

];

List name = ['Raditya dika',
'Tere Liye',
'najwa shihab',
'bernard batubara',
'Muhammad Misrad',
'Eka Kurniawan',
'Valerie Patkar',
'Almira Bastari',
'Sapardi Djoko Damono',
'Asma Nadia',
'Andrea Hirata',
];
List penulisUrl = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtZjxj5PAldtJ_fhQgk0vXUsxH06W3XTTU1XKJySrtXvF6SK8s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwNJYV48Wruc5HCZOzRA0nM6wkzgxSJKwBLekigojqXCfvtwko',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQcypNycvUxbEb7tPEtt8zAKwptk36Brlu0iwLuQ9hdJUwP-D1X',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTwIvLjg9JWcwgle9m0m-ibpmaaS3D0LNUAt_TUlByTwIv9pDib',
  'https://www.gramedia.com/blog/content/images/2018/09/micw_2-2.jpeg',
  'https://www.gramedia.com/blog/content/images/2018/09/Eka-Kurniawan-TRF.jpg',
  'https://www.gramedia.com/blog/content/images/2018/09/Valerie-Patkar-1.jpeg',
  'https://www.gramedia.com/blog/content/images/2018/09/Almira-Bastari-2.JPG',
  'https://www.gramedia.com/blog/content/images/2018/09/Sapardi-Djoko-Damono-2.jpg',
  'https://cdn.idntimes.com/content-images/community/2018/01/asma-nadia-5d3d4e76c4d9e734c2b8537b341c9268.jpg',
  'https://cdn.idntimes.com/content-images/community/2018/01/andrea-hirata-8eeb86a9a431ff4e2abdb3518be83b47.jpg'

];
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
  return true;
}

Future<Map> login({@required String email, @required String password}) async {
  var url = host + '/api/penyumbang/login';
  Map<String, String> headers = {"Content-type": "application/json"};

    return {"success": true, "_id": 'test12345677'};

}

///////////////////////////////////////////////////////////////////////////////




Future<List> getKreatorByKategori(String kategori) async {
  var list = [];
  for(var a = 0;a<dummyNama.length;a++){
    list.add({"idKreator": name[a],
      "nama": name[a],
      "skor": Random().nextInt(10),
      "jumlahKarya": Random().nextInt(10),
      "urlImage": penulisUrl[a]});
  }

  var b = [...list];
  return b;
}

Future<List> searchKreator(String kategori, String avs) async {
  var list = [];
  for(var a = 0;a<dummyNama.length;a++){
    list.add({"idKreator": name[a],
      "nama": name[a],
      "skor": Random().nextInt(10).toString(),
      "jumlahKarya": Random().nextInt(10).toString(),
      "urlImage": dummyLink[a]});
}
  var  a ={
    "idKreator": '',
    "nama": '',
    "skor": '',
    "jumlahKarya": '',
    "urlImage": ''
  };
  var b = [{a}];
  return b;

}

Future<Map> getKaryaListByKreatorId(String idKreator) async {
print('afe');
  List dataList = [];
  for(var a = 0;a<dummyNama.length;a++){
    dataList.add({"idKreator": dummyNama[a],
      "judulKarya": dummyNama[a],
      "rating": 10,
      "jumlahKarya": Random().nextInt(10).toString(),
      "imageUrl": dummyLink[a],
      "idKarya":''
    });
  }
print(dataList.length);
  Map kreatorData = {
    "namaKreator": 'Raditya Dika',
    "picUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTtZjxj5PAldtJ_fhQgk0vXUsxH06W3XTTU1XKJySrtXvF6SK8s",
    "kategori": "Unimplement",
    "point": 100,
    "jumlahKarya": 20,
    "karya": dataList
  };
  print(kreatorData);

  await Future.delayed(Duration(
    seconds: 2
  ));
  return kreatorData;
}

Future<Map> getSpecificKarya(String idKreator, String idKarya) async {

  Map kreatorData = {
    "namaKarya": dummyNama[0],
    "rating": '0',
    "picUrl":
    dummyLink[0],
    "deskripsi":
    dummyDesc[0],
  };
  await Future.delayed(Duration(seconds: 1));
  return kreatorData;
}

Future<List> getTukarPoinData(String idKreator) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(idKreator);
  var url = host + '/api/reward/5dc485c18c54b81d98686c44';
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
  List res = [
    {
      "picUrl":'https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-camera-512.png',
      "title": 'Foto Bareng',
      "poin": 900,
      'link': ''
    },
    {
      "picUrl":'https://image.flaticon.com/icons/png/512/45/45332.png',
      "title": 'Makan Bareng',
      "poin": 9000,
      'link': ''
    }
  ];
  return res;
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