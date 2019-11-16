import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:support_in/components/card_konten.dart';
import 'package:support_in/components/penulis_bar.dart';
import 'package:support_in/helper/async_func.dart';

class DaftarKarya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    Future<Map> kreatorData = getKaryaListByKreatorId(args['idKreator']);
    if (args == null) args = {};
    return Scaffold(
        floatingActionButton: Container(
          width: MediaQuery
              .of(context)
              .size
              .width - 32,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(color: Theme
                            .of(context)
                            .primaryColor),
                        borderRadius: new BorderRadius.circular(4)),
                    child: Text(
                      'DUKUNG',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(color: Theme
                            .of(context)
                            .primaryColor),
                        borderRadius: new BorderRadius.circular(4)),
                    child: Text(
                      'TUKAR POIN',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text('Karya'),
          centerTitle: true,
        ),
        body: Container(
          color: Theme
              .of(context)
              .primaryColor,
          child: ListView(
            children: <Widget>[
              FutureBuilder(
                future: kreatorData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return PenulisBar(

                      name: data['namaKreator'],
                      imageUrl: data['picUrl'],
                      jumlahKarya: data['jumlahKarya'],
                      poin: data['point'],
                      idKreator: args['idKreator'],
                    );
                  }
                  return Container(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    height: 110,
                    child: Center(
                      child: Text('loading'),
                    ),
                  );
                },
              ),
              Container(
                child: FutureBuilder(
                    future: kreatorData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Widget> listWidget =
                        List<Widget>.from(snapshot.data['karya']
                            .map((e) =>
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushNamed(
                                      '/deskripsi-karya', arguments: {
                                    'idKreator': args['idKreator'],
                                    'idKarya': e['idKarya']
                                  }),
                              child: CardKonten(
                                imageUrl: e['imageUrl'],
                                title: e['judulKarya'],
                                rating: '0,4',
                              ),
                            ))
                            .toList());
                        return Column(children: [
                          ...listWidget,
                          Container(height: MediaQuery
                              .of(context)
                              .size
                              .height,)
                        ]);
                      }
                      return Container(
                        height: (MediaQuery
                            .of(context)
                            .size
                            .height - 190),
                        child: SpinKitRing(
                          lineWidth: 5,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                      );
                    }),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
