import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'lib/assets/support.png',
                        height: 42,
                        width: 42,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Text(
                      'Support.in',
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Nunito Sans'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('lib/assets/ilus2.png'))),
                  height: 280,
                  width: 296,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  'Ayo Terus Dukung Mereka',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Mereka membutuhkan kamu untuk terus menghasilkan karya.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff3D3D3D),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Hero(
                  tag: 'login',
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    onPressed: () async {
//                    var sharedPreference = await SharedPreferences.getInstance();
//                    var userId = await getUserId();
//                    sharedPreference.setString('userId', userId);
                      Navigator.pushNamed(context, '/login');
                    },
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: new BorderRadius.circular(4)),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Hero(
                tag: 'register',
                child: FlatButton(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  onPressed: () => Navigator.of(context).pushNamed('/register'),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
