import 'package:flutter/material.dart';
import 'package:support_in/components/register_form.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 48, 24, 27),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text('Register', style: Theme.of(context).textTheme.title),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ReusableForm(
                    'Full Name',
                    textEditingController: _fullName,
                  ),
                  ReusableForm(
                    'Email',
                    textEditingController: _email,
                  ),
                  ReusableForm(
                    'Password',
                    obscureText: true,
                    textEditingController: _password,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: Hero(
                      tag: 'register',
                      child: FlatButton(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            borderRadius: new BorderRadius.circular(4)),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
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
