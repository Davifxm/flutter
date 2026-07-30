import 'package:flutter/material.dart';

class GaleriaPage extends StatelessWidget {
  const GaleriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 242, 242),

      appBar: AppBar(
        title: const Text('Galeria'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/images.webp'),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),

                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,

                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/goku.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Center(
                        child: Image.asset(
                          'assets/images/naruto.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Center(
                        child: Image.asset(
                          'assets/images/luffy.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Center(
                        child: Image.asset(
                          'assets/images/gojo.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
