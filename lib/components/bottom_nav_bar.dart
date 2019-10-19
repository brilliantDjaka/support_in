import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Rewards'),
          icon: Icon(Icons.card_giftcard),
        )
      ],
      currentIndex: 1,
      selectedItemColor: Theme.of(context).accentColor,
      onTap: (index) {
        if (index == 0)
          Navigator.pushNamedAndRemoveUntil(
              context, '/', (Route<dynamic> route) => false);
        else
          Navigator.of(context).pushNamed('/tukar-point');
      },
    );
  }
}
