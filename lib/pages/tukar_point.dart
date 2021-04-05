import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:support_in/components/penulis_bar.dart';
import 'package:support_in/components/reward_card.dart';
import 'package:support_in/components/support_card.dart';
import 'package:support_in/helper/async_func.dart';

class TukarPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    Future kreatorData = getKaryaListByKreatorId('');
    if (args == null) args = {};
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Tukar Poin'),
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
                      idKreator: 'afewaf',
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
                height: MediaQuery.of(context).size.height -190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: FutureBuilder(
                    future: getTukarPoinData('awef'),
                    builder: (BuildContext context,
                        AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data.map((e) =>
                            RewardCard(
                              kreatorId: 'afewaf',
                              title: e['title'],
                              poin: e['poin'],
                              imageUrl: e['picUrl'],
                            )).toList();
                        return Column(
                          children: data,
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
              )
            ],
          ),
        ));
  }
}
