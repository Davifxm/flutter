import 'package:flutter/material.dart';

class Exercicio10Page extends StatelessWidget {
  const Exercicio10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          // Correção: a tela vertical usa Column no lugar de Row.
          children: [
            const Text(
              'Criar uma nova conta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/icon/app_icon.png',
              // Correção: a propriedade correta é width, não largura.
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const TextField(
              // Correção: decoration precisa receber InputDecoration.
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Correção: ElevatedButton exige a função onPressed.
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cadastro realizado!')),
                  );
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
