import 'package:flutter/material.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';

class LoginContent extends StatelessWidget {
  final Widget child;
  const LoginContent({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.backgroundColor,
              ),
              child: child,
            ),
          ]),
    );
  }
}
