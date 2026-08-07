# Correções dos exercícios Flutter

O código original possuía dez exercícios misturados dentro de `main.dart`, inclusive textos que não fazem parte da linguagem Dart. A solução foi separada em um menu e dez páginas na pasta `lib/exercicios`.

| Exercício | Erro encontrado | Correção aplicada |
|---|---|---|
| 1 | `Navigator.push` sem contexto e sem rota | Uso de `context` e `MaterialPageRoute` |
| 2 | Botão voltar chamava `Navigator.push` | Uso de `Navigator.pop(context)` |
| 3 | `main` sem parênteses e ausência de `runApp` | Criação de `main()` com `runApp(const MeuApp())` |
| 4 | `Scaffold` e `MaterialApp` estavam invertidos | `MaterialApp` na raiz e `Scaffold` como tela |
| 5 | `useMaterial3` recebia uma `String` | Uso do valor booleano `true` e `ColorScheme.fromSeed` |
| 6 | `shape` recebia o número `10` | Uso de `RoundedRectangleBorder` |
| 7 | Ícones recebiam tipos e propriedades inválidos | Uso de `Icons`, `size` e widget `Icon` |
| 8 | Dependência, booleanos e caminho do ícone incorretos | Configuração válida no `pubspec.yaml` |
| 9 | Uso incorreto de `child`, `children`, lista e conjunto | Hierarquia correta de `Column`, `Row` e `Container` |
| 10 | Layout horizontal e parâmetros inválidos | `Column`, `width`, `InputDecoration` e `onPressed` |

Todos os arquivos possuem comentários curtos próximos das correções principais.
