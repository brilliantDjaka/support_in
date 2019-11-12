import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TukarPointCard extends StatefulWidget {
  String judul;
  String deskripsi;
  int point;
  String urlImage;
  Function callbackPoint;

  TukarPointCard(
      {@required this.judul, @required this.deskripsi, @required this.point, @required this.urlImage,
        @required this.callbackPoint
      });

  @override
  _TukarPointCardState createState() => _TukarPointCardState();
}

class _TukarPointCardState extends State<TukarPointCard> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.urlImage),
                        fit: BoxFit.cover
                    ),
                    color: Color(0xffC4C4C4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Text(
                '${widget.point.toString()}Point',
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  widget.judul,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 15,
                      ),
                ),
                Text(
                  widget.deskripsi,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: FlatButton(
                    child: Text(
                      pressed ? 'Buka Reward' : 'Tukarkan',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Alert(
                        title: widget.judul,
                        style: AlertStyle(
                          isCloseButton: false,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Apakah Anda yakin memilih opsi ini?',
                          style: Theme.of(context).textTheme.caption.copyWith(),
                        ),
                        context: context,
                        buttons: [
                          DialogButton(
                            child: Text(
                              'Tidak Yakin',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.redAccent,
                          ),
                          DialogButton(
                            child: Text(
                              'Yakin',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color(0xff7BE172),
                            onPressed: () {
                              setState(() {
                                pressed = true;
                                widget.callbackPoint(-100);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ]).show(),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
