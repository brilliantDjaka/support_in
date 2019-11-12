import 'package:flutter/material.dart';

class DaftarKreatorList extends StatelessWidget {
  String nama;
  int jumlahKarya;
  double skor;
  String urlImage;
  String idKreator;

  DaftarKreatorList(
      {@required this.nama, @required this.jumlahKarya, @required this.skor,
        @required this.urlImage, @required this.idKreator

      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/daftar-karya', arguments: {
          "idKreator": idKreator
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          children: <Widget>[
            urlImage == null || urlImage.isEmpty ? Image.asset(
                'lib/assets/avatar.png', height: 70, width: 70) : Image.network(
              urlImage, height: 70, width: 70, semanticLabel: 'loading',),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(nama,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontSize: 22))),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text('${jumlahKarya.toString()} Karya',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 16)),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.star_half,
                              color: Theme.of(context).accentColor,
                            ),
                            Text(skor.toStringAsFixed(2),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 14))
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
