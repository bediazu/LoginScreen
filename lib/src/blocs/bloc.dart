import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:login_bloc/src/blocs/validators.dart';

class Bloc with Validators {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  /* Getter */
  //Add data to stream
  Function (String) get changeEmail => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;

  //Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e,p)=> true);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

/* Global instance */
final bloc = Bloc();