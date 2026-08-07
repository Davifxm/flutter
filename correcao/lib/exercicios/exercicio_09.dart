import 'package:flutter/material.dart';

class Exercicio9Page extends StatelessWidget {
  const Exercicio9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout')),
      body: Center(
        child: Column(
          // Correção: Column e Row usam children com uma lista de widgets.
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Perfil do usuário',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 35),
                SizedBox(width: 8),
                Text('João', style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: 240,
              height: 100,
              alignment: Alignment.center,
              color: Colors.deepPurpleAccent,
              // Correção: Container recebe child, não children.
              child: const Text('Informações do usuário'),
            ),
          ],
        ),
      ),
    );
  }
}
