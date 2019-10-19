import 'package:flutter/material.dart';
import 'package:support_in/components/tukar_point_app_bar.dart';
import 'package:support_in/components/tukar_point_card.dart';

class TukarPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TukarPointAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              TukarPointCard(
                judul: 'Foto Selfie Bareng',
                deskripsi: 'Foto dengan artis favorite kamu',
                point: 10000,
              ),
              TukarPointCard(
                judul: 'Foto Selfie Bareng',
                deskripsi: 'Foto dengan artis favorite kamu',
                point: 10000,
              ),
              TukarPointCard(
                judul: 'Foto Selfie Bareng',
                deskripsi: 'Foto dengan artis favorite kamu',
                point: 10000,
              ),
              TukarPointCard(
                judul: 'Foto Selfie Bareng',
                deskripsi: 'Foto dengan artis favorite kamu',
                point: 10000,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
