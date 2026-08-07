import 'package:flutter/material.dart';

class Exercicio7Page extends StatelessWidget {
  const Exercicio7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ícones')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Correção: Icon recebe IconData e usa a propriedade size.
            const Icon(Icons.home, size: 40),
            const SizedBox(width: 20),
            const Icon(Icons.person, size: 40),
            const SizedBox(width: 12),
            // Correção: icon do IconButton precisa receber um Widget Icon.
            IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 40,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
