import 'package:flutter/material.dart';
import 'package:support_in/components/app_bar_raw.dart';

class TukarPointAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarRaw(
      action: <Widget>[
        IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => print('test')),
      ],
      flexibleSpaceBar: FlexibleSpaceBar(
        title: Container(
          width: 190,
          child: ListView(
            children: <Widget>[
              Container(
                height: 77,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 40, bottom: 5),
                    child: Text(
                      'Tukar Pointmu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('100pts',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  )
                ],
              ),
              Container(
                child: TextField(
                  expands: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Search...',
                      hasFloatingPlaceholder: false,
                      labelStyle: TextStyle(
                          color: Color(0xff7C7474),
                          fontSize: 14,
                          fontWeight: FontWeight.w100),
                      icon: Icon(Icons.search)),
                  style: TextStyle(
                      color: Color(0xff7C7474), fontWeight: FontWeight.w100),
                ),
                height: 27,
                padding: EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30)),
              )
            ],
          ),
        ),
        titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
    );
  }
}
