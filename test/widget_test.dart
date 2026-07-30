import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_integrado/main.dart';

void main() {
  testWidgets('Mostra a tela de login', (tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}
