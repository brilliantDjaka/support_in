import 'package:flutter/material.dart';
import './app_bar_raw.dart';
import 'package:skeleton_text/skeleton_text.dart';
class DaftarKaryaAppBar extends StatelessWidget {
  Future<Map> kreatorData;

  DaftarKaryaAppBar({
    @required this.kreatorData
  });

  @override
  Widget build(BuildContext context) {
    return AppBarRaw(
      action: <Widget>[
        IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => print('test')),
      ],
      flexibleSpaceBar: FlexibleSpaceBar(
        title: FutureBuilder(
            future: kreatorData,
            builder: (BuildContext context, AsyncSnapshot data) {
              Widget dataList =
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SkeletonAnimation(
                    child: Container(
                      height: 20,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  SkeletonAnimation(
                    child: Container(
                      height: 20,

                    ),
                  )
                ],
              );
              if (data.hasData) {
                var dataKreator = data.data;
                dataList = Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.network(
                        '${dataKreator['picUrl']}',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${dataKreator['namaKreator']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 3),
                          child: Text(
                            '${dataKreator['kategori']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('${dataKreator['jumlahKarya']} karya',
                              style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    Container(
                      width: 9,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('${dataKreator['point']} pts',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300)),
                    )
                  ],
                );
              }
              return ListView(
                  children: <Widget>[
                    Container(
                      height: 77,
                    ),
                    dataList
                  ]);
            }),
        titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      ),
    );
  }
}

