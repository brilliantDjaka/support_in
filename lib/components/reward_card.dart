import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:support_in/components/reusable_card_with_button.dart';

class RewardCard extends StatelessWidget {
  String title;
  int poin;
  String imageUrl;
  String kreatorId;

  RewardCard(
      {@required this.title,
      this.imageUrl,
      this.poin = 0,
      @required this.kreatorId});

  @override
  Widget build(BuildContext context) {
    return ReusableCardWithButton(
      title: title,
      onPress: () {
        Alert(
            context: context,
            title: 'Kamu Yakin Mau Tukar Dengan Itu?',
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
      buttonText: 'Tukar',
      subtitle: '$poin Poin',
      imageUrl: imageUrl,
    );
  }
}
