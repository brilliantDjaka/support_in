import 'package:flutter/material.dart';
import '../components/app_bar_home.dart';
import '../components/category_card.dart';
import '../components/berita_terkini_card.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            AppBarHome(),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    CategoryCard(),
                    BeritaTerkiniCard()
                  ]
              ),
            ),
          ],

        )
    );
  }
}
