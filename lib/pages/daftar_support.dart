import 'package:flutter/material.dart';
import 'package:support_in/components/bottom_nav_bar.dart';
import 'package:support_in/components/card_daftar_support.dart';
import 'package:support_in/components/daftar_karya_app_bar.dart';
class DaftarSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          DaftarKaryaAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              CardDaftarSupport(
                deskripsi:
                'Support dengan kopi, meskipun kecil tapi sangat bermanfaat untuk produktifitas gue',
                hargaDalamRupiah: 9000,
                judulCardSupport: 'Kopi',
              ),
              CardDaftarSupport(
                deskripsi:
                'Support dengan kopi, meskipun kecil tapi sangat bermanfaat untuk produktifitas gue',
                hargaDalamRupiah: 19000,
                judulCardSupport: 'Teh',
              ),
              CardDaftarSupport(
                deskripsi:
                'Support dengan kopi, meskipun kecil tapi sangat bermanfaat untuk produktifitas gue',
                hargaDalamRupiah: 30000,
                judulCardSupport: 'Susu',
              ),
              CardDaftarSupport(
                deskripsi:
                'Support dengan kopi, meskipun kecil tapi sangat bermanfaat untuk produktifitas gue',
                hargaDalamRupiah: 40000,
                judulCardSupport: 'STMJ',
              ),
              Container(
                height: 10,
              )
            ]),
          )
        ],
      ),
    );
  }
}
