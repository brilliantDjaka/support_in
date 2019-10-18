import 'package:flutter/material.dart';

class CardDaftarSupport extends StatelessWidget {
  String judulCardSupport;
  int hargaDalamRupiah;
  String deskripsi;

  CardDaftarSupport(
      {@required this.judulCardSupport,
      @required this.hargaDalamRupiah,
      @required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
              ),
            ]),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text('$judulCardSupport',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    'Rp.$hargaDalamRupiah',
                    style: TextStyle(
                      color: Color(0xffB1B1B1),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '$deskripsi',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 12),
                    )),
                    FlatButton(
                      onPressed: () => print('Oyi'),
                      child: Text(
                        'Support',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                )
              ],
            ),
            width: double.infinity,
            height: 120,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        ),
      ),
    );
  }
}
