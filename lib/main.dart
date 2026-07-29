import 'package:flutter/material.dart';


import 'pages/auditoria_pages.dart';
import 'pages/configuracoes_pages.dart';
import 'pages/dashboard_pages.dart';
import 'pages/produtos_pages.dart';
import 'pages/relatorios_pages.dart';
import 'pages/usuarios_pages.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Widget telaAtual = const DashboardPage();
  String tituloAtual = 'Dashboard';

  void mudarTela(Widget tela, String titulo) {
    setState(() {
      telaAtual = tela;
      tituloAtual = titulo;
    });

    // Fecha o menu.
    Navigator.pop(context);
  }

  void atualizarTela() {
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tela atualizada'),
      ),
    );
  }

  void fazerLogout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logout realizado'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAtual),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar',
            onPressed: atualizarTela,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: fazerLogout,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu administrativo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                mudarTela(
                  const DashboardPage(),
                  'Dashboard',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Usuários'),
              onTap: () {
                mudarTela(
                  const UsuariosPage(),
                  'Usuários',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Produtos'),
              onTap: () {
                mudarTela(
                  const ProdutosPage(),
                  'Produtos',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Relatórios'),
              onTap: () {
                mudarTela(
                  const RelatoriosPage(),
                  'Relatórios',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                mudarTela(
                  const ConfiguracoesPage(),
                  'Configurações',
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoria'),
              onTap: () {
                mudarTela(
                  const AuditoriaScreen(),
                  'Auditoria',
                );
              },
            ),
          ],
        ),
      ),
      body: telaAtual,
    );
  }
}