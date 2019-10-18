import 'package:flutter/material.dart';

class AppBarRaw extends StatelessWidget {
  List<Widget> action;
  Widget leading;
  FlexibleSpaceBar flexibleSpaceBar;
  PreferredSizeWidget preferredSizeWidget;

  AppBarRaw(
      {this.action, this.flexibleSpaceBar, this.preferredSizeWidget, this.leading});
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: leading,
      expandedHeight: 140,
      automaticallyImplyLeading: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(33, 10),
              bottomRight: Radius.elliptical(33, 10))),
      backgroundColor: Theme.of(context).primaryColor,
      actions: action,
      flexibleSpace: flexibleSpaceBar,
      bottom: preferredSizeWidget,
    );
  }
}
