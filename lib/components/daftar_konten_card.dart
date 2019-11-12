import 'package:flutter/material.dart';
import './daftar_konten_card_child.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spin;

class DaftarKontenCard extends StatelessWidget {

  Future<Map> konten;
  String idKreator;

  DaftarKontenCard(this.konten, this.idKreator);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: konten,
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            List konten = snapshot.data["karya"].map((e) =>
                DaftarKontenCardChild(
                  idKreator: idKreator,
                  title: e['judulKarya'],
                  description: e['deskripsi'],
                  rating: 0.234,
                  imageUrl: e['imageUrl'],
                )).toList();
            return Container(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Karya',
                    style:
                    Theme
                        .of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 17),
                  ),
                  ...konten,
                  Container(
                    height: 60,
                  )
                ],
              ),
            );
          } else
            return Container(
              margin:
              EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.20),
              child: Center(
                child: spin.SpinKitRing(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  lineWidth: 4,
                ),
              ),
            );
        });
  }
}
