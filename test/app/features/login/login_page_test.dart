import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:seventh_prova_flutter/app/features/login/login_module.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/features/login/repository/login_repository.dart';

import 'login_page_test.mocks.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

@GenerateMocks([LoginRepository, Client])
void main() {
  setUp(() {
    initModule(LoginModule(), replaceBinds: [
      Bind.instance<LoginRepository>(MockLoginRepository()),
      Bind.instance<Client>(MockClient()),
    ]);
  });

  testWidgets('', (WidgetTester tester) async {
    const loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage);
    // expect(find.text("Usuários"), findsOneWidget);
  });
}
