import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/authentication_intercaptor.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/error_inteceptor.dart';
import 'package:seventh_prova_flutter/app/features/login/login_module.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';

import 'login_page_test.mocks.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

@GenerateMocks([Client])
void main() {
  final clientMock = MockClient();
  final navigate = ModularNavigateMock();
  Modular.navigatorDelegate = navigate;

  setUp(() {
    initModule(LoginModule(), replaceBinds: [
      Bind.instance<InterceptedClient>(
        InterceptedClient.build(
          interceptors: [
            AutheticationInterceptor(),
            ErrorInterceptor(),
          ],
          client: MockClient(),
        ),
      ),
    ]);
  });

  testWidgets('Should find the icons', (WidgetTester tester) async {
    const loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage);
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
  });

  testWidgets('Should find username input', (WidgetTester tester) async {
    const loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage);
    expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
  });

  testWidgets('Should find password input', (WidgetTester tester) async {
    const loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
  });

  testWidgets('Should find enter button', (WidgetTester tester) async {
    const loginPage = MaterialApp(
      home: LoginPage(),
    );
    await tester.pumpWidget(loginPage);
    expect(find.widgetWithText(ElevatedButton, "LOGIN"), findsOneWidget);
  });
}
