import 'package:flutter/material.dart';

class ContatoPages extends StatefulWidget {
  const ContatoPages({super.key});

  @override
  State<ContatoPages> createState() => _ContatoPagesState();
}

class _ContatoPagesState extends State<ContatoPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    // Executa as validações dos campos.
    if (_formKey.currentState!.validate()) {
      final String name = _nameController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mensagem de $name enviada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Limpa os campos após o envio.
      _nameController.clear();
      _phoneController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    // Libera os controladores quando a tela for encerrada.
    _nameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.contact_mail,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Entre em contato',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Preencha os campos abaixo para enviar uma mensagem.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),

                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    if (value.trim().length < 3) {
                      return 'O nome deve possuir pelo menos 3 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(00) 00000-0000',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu telefone';
                    }

                    if (value.trim().length < 8) {
                      return 'Informe um telefone válido';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _messageController,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Mensagem',
                    hintText: 'Digite sua mensagem',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 80),
                      child: Icon(Icons.message),
                    ),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite uma mensagem';
                    }

                    if (value.trim().length < 10) {
                      return 'A mensagem deve possuir pelo menos 10 caracteres';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                    label: const Text('Enviar mensagem'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}