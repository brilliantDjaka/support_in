import 'package:flutter/material.dart';

class ButtonSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: FlatButton(
        padding: EdgeInsets.all(12),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed('/daftar-support');
        },
        child: Text(
          'Support yuk',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
