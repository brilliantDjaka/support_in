import 'package:flutter/material.dart';
import 'package:support_in/components/tukar_point_app_bar.dart';
import 'package:support_in/components/tukar_point_card.dart';

class TukarPoint extends StatefulWidget {
  @override
  _TukarPointState createState() => _TukarPointState();
}

class _TukarPointState extends State<TukarPoint> {

  int point = 100;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TukarPointAppBar(
            point: point,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TukarPointCard(
                judul: 'Foto Selfie Bareng',
                deskripsi: 'Foto dengan Boy Candra',
                point: 100,
                urlImage: 'https://image.freepik.com/free-vector/smartphone-selfie-flat-illustration_23-2147494734.jpg',
                callbackPoint: pointCallback,
              ),
              TukarPointCard(
                judul: 'Tanda Tangani Bukumu',
                deskripsi: 'Tanda Tangan Boy Candra di Bukumu',
                point: 100,
                urlImage: 'https://image.shutterstock.com/image-vector/manual-signature-documents-on-white-260nw-1095229262.jpg',
                callbackPoint: pointCallback,
              ),
            ]),
          )
        ],
      ),
    );
  }

  pointCallback(pointIncrement) {
    setState(() {
      point += pointIncrement;
    });
  }
}
