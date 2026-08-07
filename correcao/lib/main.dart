import 'package:flutter/material.dart';
import 'exercicios/exercicio_01.dart';
import 'exercicios/exercicio_02.dart';
import 'exercicios/exercicio_03.dart';
import 'exercicios/exercicio_04.dart';
import 'exercicios/exercicio_05.dart';
import 'exercicios/exercicio_06.dart';
import 'exercicios/exercicio_07.dart';
import 'exercicios/exercicio_08.dart';
import 'exercicios/exercicio_09.dart';
import 'exercicios/exercicio_10.dart';

// Correção do exercício 3: main precisa de parênteses e deve chamar runApp.
void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Correção dos exercícios',
      // Correção do exercício 5: useMaterial3 recebe bool, não String.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MenuExercicios(),
    );
  }
}

class MenuExercicios extends StatelessWidget {
  const MenuExercicios({super.key});

  @override
  Widget build(BuildContext context) {
    const titulos = [
      'Navigator.push()',
      'Navigator.pop()',
      'main(), runApp() e MaterialApp',
      'Estrutura básica Flutter',
      'Material 2 e Material 3',
      'Botão no Material 3',
      'Ícones na interface',
      'Ícone do aplicativo',
      'Row, Column e Container',
      'Tela completa de cadastro',
    ];

    const paginas = <Widget>[
      Exercicio1Page(),
      Exercicio2Page(),
      Exercicio3Page(),
      Exercicio4Page(),
      Exercicio5Page(),
      Exercicio6Page(),
      Exercicio7Page(),
      Exercicio8Page(),
      Exercicio9Page(),
      Exercicio10Page(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios corrigidos'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: titulos.length,
        separatorBuilder: (context, index) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(titulos[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => paginas[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
