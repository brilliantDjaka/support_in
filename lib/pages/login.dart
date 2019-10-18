import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Image.asset(
              'lib/assets/logo.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Text(
                'Support.in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            FlatButton.icon(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (Route<dynamic> route) => false);
              },
              label: Text(
                'Continue With Google',
                style: TextStyle(color: Color(0xff7C7474)),
              ),
              icon: Image.asset(
                'lib/assets/google.png',
                height: 20,
                width: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
            ),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
