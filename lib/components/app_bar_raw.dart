import 'package:flutter/material.dart';

class AppBarRaw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 140,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(33, 10),
              bottomRight: Radius.elliptical(33, 10))),
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(
            Icons.group,
            size: 30,
            color: Theme.of(context).accentColor,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => print('Pressed'),
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: ListView(
          children: <Widget>[
            Container(
              height: 90,
            ),
            Text('Hello,', style: Theme.of(context).textTheme.title),
            Text('Brian Rofiq', style: Theme.of(context).textTheme.title)
          ],
        ),
        titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
    );
  }
}
