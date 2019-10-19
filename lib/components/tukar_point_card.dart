import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TukarPointCard extends StatelessWidget {
  String judul;
  String deskripsi;
  int point;

  TukarPointCard(
      {@required this.judul, @required this.deskripsi, @required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Text(
                '${point.toString()}Point',
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  judul,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 15,
                      ),
                ),
                Text(
                  deskripsi,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: FlatButton(
                    child: Text(
                      'Tukarkan',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Alert(
                        title: judul,
                        style: AlertStyle(
                          isCloseButton: false,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Apakah Anda yakin memilih opsi ini?',
                          style: Theme.of(context).textTheme.caption.copyWith(),
                        ),
                        context: context,
                        buttons: [
                          DialogButton(
                            child: Text(
                              'Tidak Yakin',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.redAccent,
                          ),
                          DialogButton(
                            child: Text(
                              'Yakin',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color(0xff7BE172),
                            onPressed: () => print('Yakin'),
                          ),
                        ]).show(),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
