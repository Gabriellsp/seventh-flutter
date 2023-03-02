import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/headline1.dart';

import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Modular.get<LoginStore>();

    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const LoginHeader(),
                const Headline1(text: 'Login'),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    child: Column(
                      children: [
                        const UserInput(),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 32),
                          child: PasswordInput(),
                        ),
                        const LoginButton(),
                        TextButton.icon(
                          onPressed: store.login,
                          icon: const Icon(Icons.person),
                          label: const Text('Criar conta'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
