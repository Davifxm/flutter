import 'package:flutter/material.dart';

class Exercicio5Page extends StatelessWidget {
  const Exercicio5Page({super.key});

  @override
  Widget build(BuildContext context) {
    // O Material 3 e o ColorScheme estão configurados no main.dart.
    return Scaffold(
      appBar: AppBar(title: const Text('Material Design 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Botão Material 3'),
        ),
      ),
    );
  }
}
