import 'package:flutter/material.dart';
import '../components/app_bar_daftar_kreator.dart';
import '../components/daftar_kreator_list.dart';

class DaftarKreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarDaftarKreator(),
          SliverList(
            delegate: SliverChildListDelegate([
              DaftarKreatorList(
                jumlahKarya: 2,
                nama: 'Brian Rofiq',
                skor: 8.999,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
