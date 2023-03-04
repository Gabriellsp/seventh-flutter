import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';
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
    // store.verifyUserHasToken();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.showMessageError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
                  CustomSnackbar(
                    message: store.messageError,
                  ),
                )
                .closed
                .then((value) => store.setShowMessage(false));
          });
        }

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Entrar",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.backgroundColor,
                    ),
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
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 32),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
