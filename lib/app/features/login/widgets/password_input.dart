import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<LoginStore>();
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Senha',
        icon: Icon(
          Icons.lock,
        ),
      ),
      obscureText: true,
      onChanged: store.setPassword,
    );
  }
}
