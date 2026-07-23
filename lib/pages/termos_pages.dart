import 'package:flutter/material.dart';

class TermosPages extends StatelessWidget {
  const TermosPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Uso'),
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
                Icons.description,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Termos de Uso da Aplicação',
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

            const SectionTitle(title: '1. Aceitação dos termos'),
            const SectionText(
              text:
                  'Ao utilizar esta aplicação, o usuário declara que leu, '
                  'compreendeu e aceitou as condições apresentadas nestes '
                  'Termos de Uso.',
            ),

            const SectionTitle(title: '2. Uso da aplicação'),
            const SectionText(
              text:
                  'A aplicação deve ser utilizada somente para finalidades '
                  'legais. O usuário não poderá utilizar os recursos do '
                  'aplicativo para prejudicar outras pessoas ou sistemas.',
            ),

            const SectionTitle(title: '3. Dados fornecidos'),
            const SectionText(
              text:
                  'O usuário é responsável pela veracidade das informações '
                  'fornecidas. Os dados serão utilizados somente para executar '
                  'as funcionalidades disponíveis na aplicação.',
            ),

            const SectionTitle(title: '4. Responsabilidades'),
            const SectionText(
              text:
                  'A equipe responsável buscará manter a aplicação disponível '
                  'e segura, mas não garante que o serviço permanecerá livre '
                  'de interrupções ou falhas técnicas.',
            ),

            const SectionTitle(title: '5. Alterações'),
            const SectionText(
              text:
                  'Estes termos poderão ser atualizados para acompanhar '
                  'mudanças na aplicação ou na legislação. A versão mais '
                  'recente ficará disponível nesta tela.',
            ),

            const SectionTitle(title: '6. Contato'),
            const SectionText(
              text:
                  'Caso tenha alguma dúvida sobre estes termos, utilize a '
                  'tela de contato da aplicação.',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}