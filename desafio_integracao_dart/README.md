# Desafio de Integração entre Classes em Dart

## Contexto

Uma pequena plataforma de jogos digitais precisa processar compras de jogos.

O fluxo esperado é:

Usuário
→ Autenticação
→ Catálogo
→ Carrinho
→ Estoque de licenças
→ Pedido
→ Pagamento
→ Resultado final

O projeto possui diversos erros intencionais.

## Objetivo

Corrigir o projeto sem remover as classes e sem transformar tudo em uma única função.

Os alunos devem identificar:

- erros de compilação;
- imports incorretos;
- tipos incompatíveis;
- construtores incorretos;
- métodos inexistentes;
- objetos não inicializados;
- regras de negócio incorretas;
- problemas de integração entre classes;
- expectativas incorretas nos testes.

## Regras de negócio esperadas

1. O usuário precisa estar autenticado para finalizar uma compra.
2. O jogo precisa existir no catálogo.
3. O jogo precisa possuir ao menos uma licença disponível.
4. O carrinho deve somar corretamente os preços.
5. O pagamento só pode ser aprovado quando o saldo for suficiente.
6. Quando uma compra for aprovada, uma licença deve ser removida do estoque.
7. Uma compra recusada não pode reduzir o estoque.
8. O pedido aprovado deve possuir status APROVADO.
9. O pedido recusado deve possuir status RECUSADO.
10. O valor final do pedido deve ser igual ao total real do carrinho.

## Comandos

```bash
dart pub get
dart test
```

A primeira execução deverá apresentar vários erros.

A missão é corrigir o projeto até os testes passarem.
