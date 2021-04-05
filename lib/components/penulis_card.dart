import 'package:flutter/material.dart';
import 'package:support_in/components/reusable_card_list.dart';

class PenulisCard extends StatelessWidget {
  String idKreator;
  String nama;
  String urlImage;
  int jumlahKarya;

  PenulisCard(
      {@required this.urlImage,
      @required this.jumlahKarya,
      @required this.nama,
      @required this.idKreator});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/daftar-karya',
            arguments: {"idKreator": idKreator});
      },
      child: ReusableCardList(
        urlImage,
        Text(
          nama,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          '$jumlahKarya Karya',
          style: TextStyle(),
        ),
      ),
    );
  }
}
