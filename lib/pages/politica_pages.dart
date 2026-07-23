import 'package:flutter/material.dart';

class PoliticaPages extends StatelessWidget {
  const PoliticaPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Política de Privacidade'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.privacy_tip,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Política de Privacidade',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Última atualização: 23 de julho de 2026',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            const PrivacySection(
              title: '1. Dados coletados',
              text:
                  'A aplicação poderá coletar dados fornecidos diretamente '
                  'pelo usuário, como nome, telefone e conteúdo da mensagem '
                  'enviada na tela de contato.',
            ),

            const PrivacySection(
              title: '2. Finalidade da coleta',
              text:
                  'Os dados são utilizados para responder às solicitações do '
                  'usuário, prestar suporte e melhorar a experiência de uso '
                  'da aplicação.',
            ),

            const PrivacySection(
              title: '3. Armazenamento e proteção',
              text:
                  'Serão adotadas medidas técnicas e administrativas para '
                  'proteger os dados contra acessos não autorizados, perdas, '
                  'vazamentos, alterações ou destruição.',
            ),

            const PrivacySection(
              title: '4. Compartilhamento',
              text:
                  'Os dados pessoais não serão vendidos ou compartilhados '
                  'com terceiros, exceto quando necessário para cumprir uma '
                  'obrigação legal.',
            ),

            const PrivacySection(
              title: '5. Direitos do usuário',
              text:
                  'O usuário poderá solicitar acesso, correção ou exclusão '
                  'dos seus dados pessoais, respeitando as limitações e '
                  'obrigações previstas na legislação.',
            ),

            const PrivacySection(
              title: '6. Segurança',
              text:
                  'A aplicação utiliza medidas de segurança para reduzir o '
                  'risco de roubo, vazamento e uso indevido das informações.',
            ),

            const PrivacySection(
              title: '7. Contato',
              text:
                  'Dúvidas relacionadas ao tratamento de dados poderão ser '
                  'enviadas pela tela de contato da aplicação.',
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacySection extends StatelessWidget {
  final String title;
  final String text;

  const PrivacySection({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}