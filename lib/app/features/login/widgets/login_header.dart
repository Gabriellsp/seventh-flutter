import 'package:flutter/material.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/headline1.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColorLight,
              Theme.of(context).primaryColorDark,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              color: Colors.black,
            )
          ],
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(80))),
      child: Center(
          child: Text(
        "Seventh".toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      )),
    );
  }
}
