import 'package:flutter/material.dart';
import 'package:atv_tela2/pages/contato_pages.dart';
import 'package:atv_tela2/pages/home_pages.dart';
import 'package:atv_tela2/pages/politica_pages.dart';
import 'package:atv_tela2/pages/termos_pages.dart';


void main() {
  runApp(const Atividade02App());
}

class Atividade02App extends StatelessWidget {
  const Atividade02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      // Tela aberta ao iniciar o aplicativo.
      initialRoute: '/',

      // Define as rotas disponíveis.
      routes: {
        '/': (context) => const HomePages(),
        '/contato': (context) => const ContatoPages(),
        '/termos': (context) => const TermosPages(),
        '/privacidade': (context) => const PoliticaPages(),
      },
    );
  }
}