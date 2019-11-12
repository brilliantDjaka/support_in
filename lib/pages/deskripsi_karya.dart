import 'package:flutter/material.dart';
import 'package:support_in/components/bottom_nav_bar.dart';
import 'package:support_in/components/button_support.dart';
import 'package:support_in/helper/async_func.dart';
import '../components/daftar_karya_app_bar.dart';
import '../components/deskripsi_karya_card.dart';

class DeskripsiKarya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    if (args == null) args = {};

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DaftarKaryaAppBar(
            kreatorData: getKaryaListByKreatorId(args['idKreator']),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              DeskripsiKaryaCard(
                title: 'Origami Hati',
                description: '“Janganlah kamu berpaling dan membuat kita menjadi dua orang asing yang tidak mengenal satu sama lain. Di bumi ini, ada banyak sekali orang yang bisa merebutmu”',
                imageUrl: 'https://indonesiaebook.com/wp-content/uploads/2018/08/Origami-Hati-by-Boy-Candra.jpg',
              ),
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
