import 'package:flutter/material.dart';

class Exercicio1Page extends StatelessWidget {
  const Exercicio1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Correção: Navigator.push precisa do context e de uma rota.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaDetalhes()),
            );
          },
          child: const Text('Abrir detalhes'),
        ),
      ),
    );
  }
}

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: const Center(child: Text('Tela de detalhes')),
    );
  }
}
