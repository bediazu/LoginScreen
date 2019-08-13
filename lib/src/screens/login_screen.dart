import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          SizedBox(height: 20),
          submitButton()
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          shape: StadiumBorder(),
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: snapshot.hasData
              ? () {
                  print('Hola');
                }
              : null,
          color: Colors.lightBlue,
        );
      },
    );
  }
}
