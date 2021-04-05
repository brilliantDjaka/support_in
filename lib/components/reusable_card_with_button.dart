import 'package:flutter/material.dart';

class ReusableCardWithButton extends StatelessWidget {
  String imageUrl;
  String title;
  String subtitle;
  String buttonText;
  Function onPress;

  ReusableCardWithButton(
      {this.imageUrl,
      @required this.title,
      @required this.subtitle,
      @required this.buttonText,
      @required this.onPress});

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
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.all(24),
              dense: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: onPress,
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(4)),
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffDDDDDD))),
      ),
    );
  }
}
