import 'package:flutter/material.dart';
import '../components/app_bar_daftar_kreator.dart';
import '../components/daftar_kreator_list.dart';
import 'package:support_in/helper/async_func.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spin;
class DaftarKreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (args == null) {
      args = {};
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarDaftarKreator(args['kategori']),
          FutureBuilder(
            future: getKreatorByKategori(args['kategori']),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                List<Widget> listKreator = snapshot.data.map((e) {
                  return DaftarKreatorList(
                    idKreator: e['idKreator'],
                    nama: e['nama'],
                    urlImage: e['urlImage'],
                    skor: e['skor'],
                    jumlahKarya: e['jumlahKarya'],
                  );
                }).toList();
                return SliverList(
                  delegate: SliverChildListDelegate(listKreator),
                );
              }
              return SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                  ),
                  Center(
                    child: spin.SpinKitRing(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      lineWidth: 4,
                    ),
                  )
                ]),
              );
            },
          ),

        ],
      ),
    );
  }
}
