import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Logs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LogsScreen(),
    );
  }
}

// -----------------------------------------------------------------------------
// MODELO DE DADOS
// -----------------------------------------------------------------------------
class LogItem {
  final String ip;
  final String usuario;
  final DateTime dataHora;
  final String justificativa;

  LogItem({
    required this.ip,
    required this.usuario,
    required this.dataHora,
    required this.justificativa,
  });
}

// -----------------------------------------------------------------------------
// FUNÇÃO PARA CAPTURAR O IP REAL DA MÁQUINA
// -----------------------------------------------------------------------------
Future<String> obterIpDaMaquina() async {
  try {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
          return addr.address;
        }
      }
    }
  } catch (e) {
    return "127.0.0.1";
  }
  return "127.0.0.1";
}

// -----------------------------------------------------------------------------
// TELA PRINCIPAL
// -----------------------------------------------------------------------------
class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  // Função que monta os logs usando o IP detectado automaticamente
  Future<List<LogItem>> carregarLogs() async {
    String ipAtual = await obterIpDaMaquina();

    return [
      LogItem(
        ip: ipAtual, // IP CAPTURADO AUTOMATICAMENTE
        usuario: "Davi (Usuário Atual)",
        dataHora: DateTime.now(),
        justificativa: "Acesso e execução do sistema nesta máquina.",
      ),
      LogItem(
        ip: ipAtual, // IP CAPTURADO AUTOMATICAMENTE
        usuario: "Sistema",
        dataHora: DateTime.now().subtract(const Duration(minutes: 15)),
        justificativa: "Inicialização dos serviços de auditoria.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Logs'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<List<LogItem>>(
        future: carregarLogs(),
        builder: (context, snapshot) {
          // Exibe indicador de carregamento enquanto busca o IP
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text("Erro ao identificar o IP da máquina."));
          }

          final listaDeLogs = snapshot.data!;

          return ListView.builder(
            itemCount: listaDeLogs.length,
            itemBuilder: (context, index) {
              return LogCard(log: listaDeLogs[index]);
            },
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// WIDGET DO CARD DE LOG
// -----------------------------------------------------------------------------
class LogCard extends StatelessWidget {
  final LogItem log;

  const LogCard({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final String dataFormatada =
        "${log.dataHora.day.toString().padLeft(2, '0')}/"
        "${log.dataHora.month.toString().padLeft(2, '0')}/"
        "${log.dataHora.year} às "
        "${log.dataHora.hour.toString().padLeft(2, '0')}:"
        "${log.dataHora.minute.toString().padLeft(2, '0')}:"
        "${log.dataHora.second.toString().padLeft(2, '0')}";

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Usuário: ${log.usuario}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "IP: ${log.ip}",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Data/Hora: $dataFormatada",
              style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
            const Divider(height: 16),
            const Text(
              "Justificativa:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              log.justificativa,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}