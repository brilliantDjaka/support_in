import 'package:flutter/material.dart';

class BeritaTerkiniCardBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: new Container(
        height: 90,
        decoration: new BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
