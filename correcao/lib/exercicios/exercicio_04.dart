import 'package:flutter/material.dart';

class Exercicio4Page extends StatelessWidget {
  const Exercicio4Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Correção: o MaterialApp fica na raiz e o Scaffold organiza a tela.
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Aplicativo')),
      body: const Center(
        child: Text('Bem-vindo ao Flutter', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
