import 'package:flutter/material.dart';

class SearchBarPenulis extends StatefulWidget {
  TextEditingController controller;
  void Function(String) onChange;

  SearchBarPenulis(this.controller, this.onChange);

  @override
  _SearchBarPenulisState createState() => _SearchBarPenulisState();
}

class _SearchBarPenulisState extends State<SearchBarPenulis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.fromLTRB(24, 32, 24, 30),
      child: Container(
        padding: EdgeInsets.only(left: 17),
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.black.withOpacity(0.15)),
        child: Center(
          child: TextField(
            controller: widget.controller,
            onChanged: (text) => widget.onChange(text),
            style: TextStyle(
              color: Color(0xffEBEBEB),
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Mau Cari Siapa?',
                hintStyle: TextStyle(
                  color: Color(0xffEBEBEB),
                ),
                icon: Icon(
                  Icons.search,
                  color: Color(0xffEBEBEB),
                )),
          ),
        ),
      ),
    );
  }
}
