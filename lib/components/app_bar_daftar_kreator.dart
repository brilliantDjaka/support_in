import 'package:flutter/material.dart';
import './app_bar_raw.dart';

class AppBarDaftarKreator extends StatelessWidget {
  String kategori;

  AppBarDaftarKreator(this.kategori);

  @override
  Widget build(BuildContext context) {
    return AppBarRaw(
      action: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => print('Pressed'),
          ),
        )
      ],
      flexibleSpaceBar: FlexibleSpaceBar(
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              title: Text(
                '$kategori',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 30,
                  child: Container(
                    width: 42,
                    padding: EdgeInsets.only(left: 4),
                    child: TextField(
                      expands: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Search...',
                          hasFloatingPlaceholder: false,
                          labelStyle: TextStyle(
                              color: Color(0xff7C7474),
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                          icon: Icon(Icons.search)),
                      style: TextStyle(
                          color: Color(0xff7C7474),
                          fontWeight: FontWeight.w100),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30)),
                  ))),
          height: 72,
          width: 190,
        ),
        titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
    );
  }
}
