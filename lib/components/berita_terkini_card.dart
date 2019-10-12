import 'package:flutter/material.dart';
import './berita_terkini_card_box.dart';

class BeritaTerkiniCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          'Berita Terkini',
          style: TextStyle(color: Color(0xff7C7474)),
        ),
        subtitle: Column(
          children: <Widget>[
            BeritaTerkiniCardBox(),
            BeritaTerkiniCardBox(),
            BeritaTerkiniCardBox(),
            BeritaTerkiniCardBox(),
          ],
        ),
      ),
    );
  }
}
