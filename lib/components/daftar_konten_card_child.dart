import 'package:flutter/material.dart';

class DaftarKontenCardChild extends StatelessWidget {
  String imageUrl;
  double rating;
  String title;
  String description;

  DaftarKontenCardChild(
      {this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/deskripsi-karya', arguments: {"test": 'test'});
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                      image: imageUrl == null || imageUrl.isEmpty
                          ? null
                          : DecorationImage(image: NetworkImage(imageUrl)),
                      color: Color(0xffC4C4C4),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_half,
                        size: 16,
                        color: Theme
                            .of(context)
                            .accentColor,
                      ),
                      Text(
                        rating.toStringAsFixed(1),
                        style: Theme
                            .of(context)
                            .textTheme
                            .caption
                            .copyWith(),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
