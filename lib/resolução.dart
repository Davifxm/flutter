import 'package:flutter/material.dart'; // Importa os componentes visuais do Flutter (botões, textos, cores, etc.)

void telaResolucao() {
  runApp( // runApp inicia o app e desenha o widget na tela
    MaterialApp(
      home: Scaffold( 
        appBar: AppBar( // Barra superior da tela
          title: const Text("Minha Tela de Resolução"), // Texto exibido na barra superior
        ),
        body: Column( // Organiza os elementos filhos em coluna (de cima para baixo)
          children: [
        
            Column( // Uma coluna dentro da coluna principal (coluna aninhada)
              children: [
                Text(
                  'Bem-vindo à coluna 1', // Texto exibido
                  style: TextStyle( // Estilo aplicado ao texto
                    backgroundColor: Colors.indigo, // Cor de fundo do texto
                    color: Colors.white, // Cor da fonte
                  ),
                ),
                Text(
                  "Estudando Flutter",   // Texto exibido
                  textAlign: TextAlign.center, // Alinha o texto ao centro
                  style: TextStyle(
                    backgroundColor: Color.fromRGBO(20, 60, 90, 1), 
                    color: Colors.cyanAccent, // Cor da fonte
                    fontSize: 12, 
                  ),
                ),
              ],
            ),
            
            // --- COLUNA 2 ANINHADA ---
            Column( // Segunda coluna aninhada, abaixo da primeira
              children: [
                Text(
                  "Agora é a coluna 2", // Texto exibido
                  style: TextStyle(
                    backgroundColor: Colors.teal, // Cor de fundo do texto
                    color: Colors.black, // Cor da fonte
                  ),
                ),
                Text(
                  "Praticando na aula",
                  style: TextStyle(
                    backgroundColor: Colors.black, // Cor de fundo do texto
                    color: Colors.white, // Cor da fonte
                    fontSize: 32, 
                  ),
                ),
              ],
            ),
          ],            
        ),
      ),
    ),
  );
}