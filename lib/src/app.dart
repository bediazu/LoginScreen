import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

/* Al menos en esta aplicacion, interesa que todos sean statelessWidget */
/* No son necesariamente incompatibles */

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginBloc',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: LoginScreen()
        )
      )
    );
  }
}