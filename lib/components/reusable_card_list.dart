import 'package:flutter/material.dart';

class ReusableCardList extends StatelessWidget {
  String imageUrl;
  Widget title;
  Widget subtitle;

  ReusableCardList(this.imageUrl, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
        children: <Widget>[
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
                image: imageUrl == null || imageUrl.isEmpty
                    ? null
                    : DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                color: Color(0xffC4C4C4),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: title,
                    width: MediaQuery.of(context).size.width - 168),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                subtitle
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffDDDDDD))),
      ),
    );
  }
}
