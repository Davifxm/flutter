import 'package:flutter/material.dart';




class HomePages extends StatelessWidget {
  const HomePages ({ super.key});


  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 02'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.phone_android,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            const Text(
              'Escolha uma tela',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/contato');
              },
              icon: const Icon(Icons.contact_mail),
              label: const Text('Contato'),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/termos');
              },
              icon: const Icon(Icons.description),
              label: const Text('Termos de Uso'),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/privacidade');
              },
              icon: const Icon(Icons.privacy_tip),
              label: const Text('Política de Privacidade'),
            ),
          ],
        ),
      ),
    );
  }
}
