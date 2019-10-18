import 'package:flutter/material.dart';
import 'package:support_in/components/bottom_nav_bar.dart';
import 'package:support_in/components/button_support.dart';
import '../components/daftar_karya_app_bar.dart';
import '../components/deskripsi_karya_card.dart';

class DeskripsiKarya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DaftarKaryaAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              DeskripsiKaryaCard(),
              Container(
                height: 60,
              )
            ]),
          )
        ],
      ),
      floatingActionButton: ButtonSupport(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
