import 'package:flutter/material.dart';

class Exercicio2Page extends StatelessWidget {
  const Exercicio2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SegundaTela()),
            );
          },
          child: const Text('Avançar'),
        ),
      ),
    );
  }
}

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda tela')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Correção: pop retira a tela atual da pilha de navegação.
            Navigator.pop(context);
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}
