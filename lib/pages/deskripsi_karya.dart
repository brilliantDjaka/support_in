import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:support_in/components/detail_page_head.dart';
import 'package:support_in/helper/async_func.dart';

class DeskripsiKarya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (args == null) args = {};
    return Scaffold(
      body: Container(
        color: Theme
            .of(context)
            .primaryColor,
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: FutureBuilder(
                    future: getSpecificKarya(
                        args['idKreator'], args['idKarya']),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        return Column(
                          children: <Widget>[
                            DetailPageHead(
                              judul: data['namaKarya'],
                              rating: data['rating'],
                              idKreator: args['idKreator'],
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 200,
                              decoration: BoxDecoration(
                                image: data['picUrl'] == null ||
                                    data['picUrl'].isEmpty
                                    ? null
                                    : DecorationImage(
                                    image: NetworkImage(data['picUrl']),
                                    fit: BoxFit.cover),
                                color: Color(0xffF0F0F0),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(24),
                              child: Text(data['deskripsi']),
                            )
                          ],
                        );
                      }
                      return Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height - 80,
                        child: SpinKitRing(
                          lineWidth: 5,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                      );
                    })),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
        elevation: 0,
      ),

    );
  }
}
