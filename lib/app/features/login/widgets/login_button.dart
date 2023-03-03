import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<LoginStore>();
    return Observer(
      builder: (_) {
        return ElevatedButton(
            onPressed: store.login,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              child: store.isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    )
                  : Text(
                      'Entrar'.toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
            ));
      },
    );
  }
}
