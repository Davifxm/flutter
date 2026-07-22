import 'package:flutter/material.dart';

class GaleriaPage extends StatelessWidget {
  const GaleriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text('Galeria'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),

            const ListTile(
              leading: Icon(Icons.home),
              title: Text('inicio'),
            ),
            const ListTile(
        leading: Icon(Icons.image),
        title: Text('Galeria'),
      ),
      const ListTile(
        leading: Icon(Icons.info),
        title: Text('Sobre'),
      ),
          ]
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
            child: Image.asset('images/images.webp'),
            )
          ]
        )
      )
    );
  }
}