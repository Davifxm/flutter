import 'package:correcao/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('exibe o menu com os dez exercícios', (tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('Exercícios corrigidos'), findsOneWidget);
    expect(find.text('Navigator.push()'), findsOneWidget);
  });
}
