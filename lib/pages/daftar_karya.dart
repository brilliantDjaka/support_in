import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:support_in/components/bottom_nav_bar.dart';
import 'package:support_in/components/button_support.dart';
import 'package:support_in/helper/async_func.dart';
import '../components/daftar_karya_app_bar.dart';
import '../components/daftar_konten_card.dart';

class DaftarKarya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
    Future kreatorData = getKaryaListByKreatorId(args['idKreator']);
    if (args == null) args = {};
    return Scaffold(
        floatingActionButton: ButtonSupport(),
        body: CustomScrollView(
          slivers: <Widget>[
            DaftarKaryaAppBar(
              kreatorData: kreatorData,
            ),
            SliverList(
              delegate:
              SliverChildListDelegate(
                  [DaftarKontenCard(kreatorData, args['idKreator'])]),
            )
          ],
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
