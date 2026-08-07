import 'package:flutter/material.dart';

class Exercicio6Page extends StatelessWidget {
  const Exercicio6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Botão Material 3')),
      body: Center(
        child: ElevatedButton(
          // Correção: shape recebe um ShapeBorder, não o número 10.
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text('Continuar'),
        ),
      ),
    );
  }
}
