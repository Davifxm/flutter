import 'package:flutter/material.dart';

import 'auditoria_pages.dart';
import 'configuracoes_pages.dart';
import 'contato_pages.dart';
import 'dashboard_pages.dart';
import 'galeria_page.dart';
import 'logs_page.dart';
import 'politica_pages.dart';
import 'produtos_pages.dart';
import 'relatorios_pages.dart';
import 'termos_pages.dart';
import 'usuarios_pages.dart';

class PainelAdministrativoPage extends StatefulWidget {
  const PainelAdministrativoPage({super.key});

  @override
  State<PainelAdministrativoPage> createState() =>
      _PainelAdministrativoPageState();
}

class _PainelAdministrativoPageState extends State<PainelAdministrativoPage> {
  Widget telaAtual = const DashboardPage();
  String tituloAtual = 'Dashboard';

  void mudarTela(Widget tela, String titulo) {
    setState(() {
      telaAtual = tela;
      tituloAtual = titulo;
    });

    Navigator.pop(context);
  }

  void atualizarTela() {
    setState(() {});

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Tela atualizada')));
  }

  void fazerLogout() {
    Navigator.pop(context);
  }

  void abrirPagina(Widget pagina) {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (context) => pagina));
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
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu administrativo',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            itemMenu(Icons.dashboard, 'Dashboard', const DashboardPage()),
            const Divider(),
            itemPagina(Icons.image, 'Galeria', const GaleriaPage()),
            itemPagina(Icons.contact_mail, 'Contato', const ContatoPages()),
            itemPagina(Icons.description, 'Termos de Uso', const TermosPages()),
            itemPagina(
              Icons.privacy_tip,
              'Política de Privacidade',
              const PoliticaPages(),
            ),
            itemPagina(Icons.list_alt, 'Logs', const LogsScreen()),
            const Divider(),
            itemMenu(Icons.people, 'Usuários', const UsuariosPage()),
            itemMenu(Icons.shopping_bag, 'Produtos', const ProdutosPage()),
            itemMenu(Icons.bar_chart, 'Relatórios', const RelatoriosPage()),
            itemMenu(
              Icons.settings,
              'Configurações',
              const ConfiguracoesPage(),
            ),
            itemMenu(Icons.history, 'Auditoria', const AuditoriaScreen()),
          ],
        ),
      ),
      body: telaAtual,
    );
  }

  Widget itemMenu(IconData icone, String titulo, Widget tela) {
    return ListTile(
      leading: Icon(icone),
      title: Text(titulo),
      onTap: () => mudarTela(tela, titulo),
    );
  }

  Widget itemPagina(IconData icone, String titulo, Widget pagina) {
    return ListTile(
      leading: Icon(icone),
      title: Text(titulo),
      onTap: () => abrirPagina(pagina),
    );
  }
}
