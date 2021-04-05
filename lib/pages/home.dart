import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/app_bar_home.dart';
import '../components/category_card.dart';
import '../components/berita_terkini_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.more_horiz),
            onSelected: (int a) async {
              var sharedPreference = await SharedPreferences.getInstance();
              sharedPreference.clear();
              Navigator.of(context).popUntil((route) =>
              route.isFirst);
              Navigator.pushReplacementNamed(context, '/unlogin');
            },
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: 1,
                child: Text("Logout"),
              ),

            ],
          )
        ],
        title: Text(
          'Support.in',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Nunito Sans'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xffE7EFF2),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'lib/assets/dash.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.65,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 65,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Container(
              child: CarouselSlider(
                enableInfiniteScroll: false,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.30,
                items: [
                  {"url": "lib/assets/penulis.png", "kategori": "Penulis"},
                  {
                    "url": "lib/assets/konten_kreator.png",
                    "kategori": "Konten Kreator"
                  },
                  {"url": "lib/assets/developer.png", "kategori": "Developer"},
                  {"url": "lib/assets/seniman.png", "kategori": "Seniman"}
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        child: Image.asset(
                          i['url'],
                        ),
                        onTap: () =>
                            Navigator.of(context).pushNamed(
                                '/daftar-kreator',
                                arguments: {"kategori": i['kategori']}),
                      );
                    },
                  );
                }).toList(),
              ),
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
