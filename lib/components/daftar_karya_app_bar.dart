import 'package:flutter/material.dart';
import './app_bar_raw.dart';

class DaftarKaryaAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarRaw(
      action: <Widget>[
        IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => print('test')),
      ],
      flexibleSpaceBar: FlexibleSpaceBar(
        title: ListView(
          children: <Widget>[
            Container(
              height: 77,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset(
                    'lib/assets/avatar.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Antony Salim',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      child: Text(
                        'Penulis, Konten Kreator',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('50 karya',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w300)),
                    )
                  ],
                ),
                Container(
                  width: 9,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('100pts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w300)),
                )
              ],
            )
          ],
        ),
        titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
    );
  }
}
