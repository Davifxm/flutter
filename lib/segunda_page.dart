import 'package:flutter/material.dart';

class SegundaPage extends StatelessWidget {
  const SegundaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Tela"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 5000,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/images.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Voltar"),
            ),
          ),
        ),
      ),
    );
  }
}