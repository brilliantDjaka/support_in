import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PenulisBar extends StatelessWidget {
  String imageUrl;
  String name;
  int jumlahKarya;
  int poin;
  String idKreator;

  PenulisBar(
      {@required this.name,
      @required this.jumlahKarya,
      @required this.poin,
      @required this.imageUrl,
      @required this.idKreator});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.fromLTRB(24, 25, 24, 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 24),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                image: imageUrl == null || imageUrl.isEmpty
                    ? null
                    : DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                color: Color(0xffF1F1F1),
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito Sans',
                    ),
                  ),
                  Text(
                    '$jumlahKarya Karya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito Sans',
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => {
                if (ModalRoute.of(context).settings.name != '/tukar-point')
                  Navigator.of(context).pushNamed('/tukar-point',
                      arguments: {'idKreator': idKreator})
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(11, 4, 11, 4),
                child: Text(
                  '$poin Poin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito Sans',
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withOpacity(0.15)),
              ),
            )
          ],
        ));
  }
}
