import 'package:flutter/material.dart';
import 'painel_administrativo_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  bool aceitouTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/images.webp',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu e-mail';
                  }

                  if (!value.contains('@')) {
                    return 'Digite um e-mail válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 16),

              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite sua senha';
                  }

                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 50,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),

                  onPressed: () {
                    if (!aceitouTermos) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Você precisa aceitar os termos'),
                        ),
                      );
                    } else if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PainelAdministrativoPage(),
                        ),
                      );
                    }
                  },

                  child: const Text('Entrar', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    value: aceitouTermos,
                    onChanged: (valor) {
                      setState(() {
                        aceitouTermos = valor!;
                      });
                    },
                  ),

                  const Text(
                    "Aceito os termos",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
