import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/custom_snackbar.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var store = Modular.get<LoginStore>();

  @override
  void initState() {
    super.initState();
    store.verifyUserHasToken();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LoginContent(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    child: Column(
                      children: const [
                        UserInput(),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 32),
                          child: PasswordInput(),
                        ),
                        LoginButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
