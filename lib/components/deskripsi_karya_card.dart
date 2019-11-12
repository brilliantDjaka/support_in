import 'package:flutter/material.dart';

class DeskripsiKaryaCard extends StatelessWidget {
  String imageUrl;
  String title;
  String description;

  DeskripsiKaryaCard({
    @required this.imageUrl,
    @required this.title,
    @required this.description
  });
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
                  title,
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
                '9.5',
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
                        : DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    color: Color(0xffC4C4C4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  description,
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
              'Novel Boy Candra ini bercerita tentang cinta, persahabatan dan dibumbui dengan sedikit pengkhianatan ala anak remaja. Bahasa yang digunakan dalam buku ini juga cukup ringan, sehingga pembaca tidak perlu bersusah payah untuk mengikuti alur cerita buku ini. Buku-buku seperti ini banyak disukai oleh remaja-remaja, karena kisahnya yang sering kali serupa dengan kehidupan nyata yang mereka alami. Nampaknya Boy Candra memang mengerti banyak tentang dunia remaja sehingga bisa menghayatinya dengan baik.',
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
