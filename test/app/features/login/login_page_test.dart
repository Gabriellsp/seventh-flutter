import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/error_inteceptor.dart';
import 'package:seventh_prova_flutter/app/features/login/login_module.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/models/response_error.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';

import '../../../material_app_widget.dart';
import '../../mocks/auth_storage_mock.dart';

void main() {
  void initModuleLoginPage(
      String messageError, int statusCode, GlobalStore globalStore) {
    final authStorageMock = AuthStorageMock();
    final futureSave = Future.value(null);
    when(() => authStorageMock.saveTokenToStorage(any())).thenAnswer(
      (invocation) => futureSave,
    );
    final futureToken = Future.value(TokenModel(token: ""));
    when(() => authStorageMock.getTokenFromStorage()).thenAnswer(
      (invocation) => futureToken,
    );
    initModule(LoginModule(), replaceBinds: [
      Bind.instance<InterceptedClient>(InterceptedClient.build(
        interceptors: [
          ErrorInterceptor(globalStore),
        ],
        client: MockClient((_) async => Response(
            jsonEncode(ResponseError(message: messageError).toJson()),
            statusCode)),
      )),
      Bind.instance<AuthStorage>(authStorageMock),
    ]);
  }

  tearDown(() {
    Modular.destroy();
  });
  group('LoginPage Components', () {
    testWidgets('Should find the icons', (WidgetTester tester) async {
      const messageError = "Sucess";
      const statusCode = 200;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);

      await tester.pumpWidget(loginPage);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets('Should find username input', (WidgetTester tester) async {
      const messageError = "Sucess";
      const statusCode = 200;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);

      await tester.pumpWidget(loginPage);
      expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
    });

    testWidgets('Should find password input', (WidgetTester tester) async {
      const messageError = "Sucess";
      const statusCode = 200;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);

      await tester.pumpWidget(loginPage);
      expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
    });

    testWidgets('Should find enter button', (WidgetTester tester) async {
      const messageError = "Sucess";
      const statusCode = 200;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);
      await tester.pumpWidget(loginPage);
      expect(find.widgetWithText(ElevatedButton, "LOGIN"), findsOneWidget);
    });
  });

  group('Snackbar Error', () {
    testWidgets('Should render snackbar with message: Invalid login',
        (WidgetTester tester) async {
      const messageError = "Invalid login";
      const statusCode = 400;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);
      await tester.pumpWidget(loginPage);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(SnackBar, "Invalid login"), findsOneWidget);
    });

    testWidgets('Should render snackbar with message: Authentication failed',
        (WidgetTester tester) async {
      const messageError = "Authentication failed";
      const statusCode = 401;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);

      await tester.pumpWidget(loginPage);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(SnackBar, "Authentication failed"),
          findsOneWidget);
    });

    testWidgets(
        'Should render snackbar with message: Unexpected error! Try again later ...',
        (WidgetTester tester) async {
      const messageError = "Unexpected error! Try again later ...";
      const statusCode = 500;
      final globalStore = GlobalStore();
      var loginPage = MaterialAppWidget(
        globalStore: globalStore,
        child: const LoginPage(),
      );
      initModuleLoginPage(messageError, statusCode, globalStore);

      await tester.runAsync(() async {
        await tester.pumpWidget(loginPage);
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        expect(
            find.widgetWithText(
                SnackBar, "Unexpected error! Try again later ..."),
            findsOneWidget);
      });
    });
  });
}
