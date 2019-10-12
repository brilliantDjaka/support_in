import 'package:flutter/material.dart';
import '../components/category_card_box.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        child: ListTile(
            title: Text(
              'kategori',
              style: TextStyle(color: Color(0xff7C7474)),
            ),
            subtitle: GridView.count(
              childAspectRatio: 1.1,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              crossAxisCount: 2,
              children: <Widget>[
                CategoryCardBox('lib/assets/penulis.png', 'Penulis'),
                CategoryCardBox(
                    'lib/assets/content_creator.png', 'Konten Kreator'),
                CategoryCardBox('lib/assets/open_source_dev.png', 'Developer'),
                CategoryCardBox('lib/assets/seniman.png', 'Seniman'),
              ],
            )),
      ),
    );
  }
}
