import 'dart:io';

import 'package:flutter/material.dart';

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

Future<String> obterIpDaMaquina() async {
  try {
    for (var interface in await NetworkInterface.list()) {
      for (var endereco in interface.addresses) {
        if (endereco.type == InternetAddressType.IPv4 && !endereco.isLoopback) {
          return endereco.address;
        }
      }
    }
  } catch (erro) {
    return '127.0.0.1';
  }

  return '127.0.0.1';
}

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  Future<List<LogItem>> carregarLogs() async {
    String ipAtual = await obterIpDaMaquina();

    return [
      LogItem(
        ip: ipAtual,
        usuario: 'Davi (Usuário Atual)',
        dataHora: DateTime.now(),
        justificativa: 'Acesso e execução do sistema nesta máquina.',
      ),
      LogItem(
        ip: ipAtual,
        usuario: 'Sistema',
        dataHora: DateTime.now().subtract(const Duration(minutes: 15)),
        justificativa: 'Inicialização dos serviços de auditoria.',
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
      ),
      body: FutureBuilder<List<LogItem>>(
        future: carregarLogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Erro ao carregar os logs.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return LogCard(log: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}

class LogCard extends StatelessWidget {
  final LogItem log;

  const LogCard({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    String data =
        '${log.dataHora.day}/${log.dataHora.month}/${log.dataHora.year} '
        '${log.dataHora.hour}:${log.dataHora.minute}';

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(log.usuario),
        subtitle: Text('${log.justificativa}\nIP: ${log.ip}'),
        trailing: Text(data),
      ),
    );
  }
}
