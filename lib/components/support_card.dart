import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:support_in/components/reusable_card_with_button.dart';

class SupportCard extends StatelessWidget {
  String title;
  int harga;
  String imageUrl;

  SupportCard(
      {@required this.title, @required this.imageUrl, @required this.harga});

  @override
  Widget build(BuildContext context) {
    return ReusableCardWithButton(
      title: title,
      subtitle: 'Rp. $harga',
      buttonText: 'Dukung',
      onPress: () {
        Alert(
            context: context,
            title: 'Kamu Yakin Mau Beri Dia Itu?',
            style: AlertStyle(
                overlayColor: Colors.black.withOpacity(0.2),
                titleStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  color: Color(0xff3D3D3D),
                ),
                isCloseButton: false,
                alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            buttons: [
              DialogButton(
                color: Colors.white,
                radius: BorderRadius.circular(4),
                child: Text(
                  "BATAL",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
              DialogButton(
                color: Theme.of(context).primaryColor,
                radius: BorderRadius.circular(4),
                child: Text(
                  "YAKIN",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
            ]).show();
      },
      imageUrl: imageUrl,
    );
  }
}
