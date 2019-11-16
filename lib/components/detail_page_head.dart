import 'package:flutter/material.dart';

class DetailPageHead extends StatelessWidget {
  String judul;
  String rating;
  String idKreator;

  DetailPageHead(
      {@required this.judul, @required this.rating, @required this.idKreator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Kambing Jantan',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff3D3D3D)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '4.9',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito Sans',
                        color: Color(0xff767676)),
                  ),
                  Icon(Icons.star_half, size: 12, color: Color(0xff7C7474)),
                ],
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/daftar-support',
                  arguments: {"idKreator": idKreator});
            },
            child: Text(
              'Dukung',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(4)),
          )
        ],
      ),
    );
  }
}
