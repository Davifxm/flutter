import 'package:flutter/material.dart';

class Exercicio8Page extends StatelessWidget {
  const Exercicio8Page({super.key});

  @override
  Widget build(BuildContext context) {
    // A configuração corrigida do flutter_launcher_icons está no pubspec.yaml.
    return Scaffold(
      appBar: AppBar(title: const Text('Ícone do aplicativo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icon/app_icon.png', width: 150, height: 150),
            const SizedBox(height: 18),
            const Text(
              'Ícone localizado e configurado corretamente',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
