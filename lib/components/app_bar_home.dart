import 'package:flutter/material.dart';
import './app_bar_raw.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarRaw(
      flexibleSpaceBar: FlexibleSpaceBar(
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
      action: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(
            Icons.group,
            size: 30,
            color: Colors.white,
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
    );
  }
}
