import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support_in/components/register_form.dart';
import 'package:support_in/helper/async_func.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Hero(
        tag: 'login',
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width - 32,
          child: FlatButton(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            onPressed: () async {
              try {
                var sharedPreference = await SharedPreferences
                    .getInstance();
                var data = await login(
                    email: _email.text,
                    password: _password.text
                );

                if (data['success']) {
                  sharedPreference.setString('idUser', data['_id']);
                  Navigator.of(context).popUntil((route) =>
                  route.isFirst);
                  Navigator.of(context).pushReplacementNamed('/');
                }
                else
                  throw Error();
              } catch (e) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('error'),
                ));
              }
            },
            shape: new RoundedRectangleBorder(
                side: BorderSide(color: Theme
                    .of(context)
                    .primaryColor),
                borderRadius: new BorderRadius.circular(4)),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            color: Theme
                .of(context)
                .primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 27),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text('Login', style: Theme
                  .of(context)
                  .textTheme
                  .title),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ReusableForm(
                    'Email',
                    textEditingController: _email,
                  ),
                  ReusableForm(
                    'Password',
                    obscureText: true,
                    textEditingController: _password,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
