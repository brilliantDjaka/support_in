import 'package:flutter/material.dart';
import './daftar_konten_card_child.dart';

class DaftarKontenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Karya',
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 17),
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          DaftarKontenCardChild(
            title: 'Tutur Tinular',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tortor sit amet vehicula sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut imperdie',
            rating: 9.1231,
          ),
          Container(
            height: 60,
          )
        ],
      ),
    );
  }
}
