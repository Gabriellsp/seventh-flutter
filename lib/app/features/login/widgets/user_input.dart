import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<LoginStore>();
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Usuário',
        icon: Icon(
          Icons.person,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: store.setUserName,
    );
  }
}
