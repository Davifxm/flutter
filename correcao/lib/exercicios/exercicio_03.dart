import 'package:flutter/material.dart';

class Exercicio3Page extends StatelessWidget {
  const Exercicio3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // A inicialização corrigida está no main.dart do projeto.
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 3')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'main()  →  runApp()  →  MaterialApp  →  Scaffold',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
