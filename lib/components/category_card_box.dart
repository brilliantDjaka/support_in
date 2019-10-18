import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCardBox extends StatelessWidget {
  String imageUrl;
  String label;

  CategoryCardBox(this.imageUrl, this.label);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/daftar-kreator');
      },
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        children: <Widget>[
          Container(
            height: 90,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 2.0, color: Color(0xff7C7474)),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
              child: Text(
                label,
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
