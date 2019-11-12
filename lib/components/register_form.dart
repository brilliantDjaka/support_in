import 'package:flutter/material.dart';

class ReusableForm extends StatelessWidget {
  String title;
  bool obscureText;
  TextEditingController textEditingController;

  ReusableForm(this.title,
      {this.obscureText = false, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito Sans'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).accentColor),
              child: TextFormField(
                controller: textEditingController,
                obscureText: obscureText,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
