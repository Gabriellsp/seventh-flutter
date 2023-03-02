import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<LoginStore>();
    return ElevatedButton(
      onPressed: store.login,
      child: Text(
        'Entrar'.toUpperCase(),
      ),
    );
  }
}
