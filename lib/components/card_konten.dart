import 'package:flutter/material.dart';
import 'package:support_in/components/reusable_card_list.dart';

class CardKonten extends StatelessWidget {
  String imageUrl;
  String title;
  String rating;

  CardKonten(
      {@required this.title, @required this.rating, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ReusableCardList(
        imageUrl,
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito Sans',
          ),
        ),
        Row(
          children: <Widget>[
            Text(
              rating,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito Sans',
              ),
            ),
            Icon(
              Icons.star_half,
              size: 10,
              color: Color(0xffF2C94C),
            )
          ],
        ));
  }
}
