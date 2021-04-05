import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:support_in/components/penulis_card.dart';
import 'package:support_in/components/search_bar_penulis.dart';
import 'package:support_in/helper/async_func.dart';

class DaftarKreator extends StatefulWidget {
  @override
  _DaftarKreatorState createState() => _DaftarKreatorState();
}

class _DaftarKreatorState extends State<DaftarKreator> {
  bool isSearch;
  String text;

  @override
  void initState() {
    isSearch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (args == null) {
      args = {};
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(args['kategori']),
          centerTitle: true,
        ),
        body: Container(
          color: Theme
              .of(context)
              .primaryColor,
          child: ListView(
            children: <Widget>[
              SearchBarPenulis(null, (String text) {
                setState(() {
                  this.text = text;
                  isSearch = true;
                });
              }),
              Container(
                child: FutureBuilder(
                    future: isSearch ? searchKreator(
                        args['kategori'], this.text) : getKreatorByKategori(
                        args['kategori']),
                    builder: (BuildContext context,
                        AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data.map((e) =>
                            PenulisCard(
                              idKreator: e['idKreator'],
                              nama: e['nama'],
                              urlImage: e['urlImage'],
                              jumlahKarya: e['jumlahKarya'],
                            )).toList();
                        return Column(
                          children: [...data, Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                          )
                          ],
                        );
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
