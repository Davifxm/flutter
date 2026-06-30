import 'package:flutter/material.dart';
import 'segunda_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pet-shop",
        style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold, 
              letterSpacing: 1.2,
              


        ),
        
        
        
        ),
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/images.webp',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
     
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SegundaPage(),
                  ),
                );
              },
              child: const Text("Ir para Segunda Tela"),
            ),
          ],
        ),
      ),
    );
  }
}