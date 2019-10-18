import 'package:flutter/material.dart';

class DeskripsiKaryaCard extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Work Hard Pray Hard',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Icon(
                Icons.star_half,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
              Text(
                '4.5',
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 18),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                    image: imageUrl == null || imageUrl.isEmpty
                        ? null
                        : DecorationImage(image: NetworkImage(imageUrl)),
                    color: Color(0xffC4C4C4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdiet',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 14),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdiet \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdiet',
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
