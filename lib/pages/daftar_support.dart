import 'package:flutter/material.dart';
import 'package:support_in/components/bottom_nav_bar.dart';
import 'package:support_in/components/card_daftar_support.dart';
import 'package:support_in/components/daftar_karya_app_bar.dart';
import 'package:support_in/components/penulis_bar.dart';
import 'package:support_in/components/reusable_card_with_button.dart';
import 'package:support_in/components/support_card.dart';
import 'package:support_in/helper/async_func.dart';

class DaftarSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    Future kreatorData = getKaryaListByKreatorId(args['idKreator']);
    if (args == null) args = {};
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Dukungan'),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    SupportCard(
                      imageUrl: '',
                      title: 'Kopi',
                      harga: 9000,
                    ),
                    SupportCard(
                      imageUrl: '',
                      title: 'Internet',
                      harga: 50000,
                    ),
                    SupportCard(
                      imageUrl: '',
                      title: 'Makan Siang',
                      harga: 20000,
                    ),
                    SupportCard(
                      imageUrl: '',
                      title: 'Permen',
                      harga: 1000,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
