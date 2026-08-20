import 'jogo.dart';

class Carrinho {
  final List<Jogo> itens = [];

  void adicionar(Jogo jogo) {
    itens.add(jogo);
  }

  void remover(String jogoId) {
    itens.removeWhere((jogo) => jogo.id == jogoId);
  }

  double total() {
    double soma = 0;

    for (final jogo in itens) {
      soma += jogo.preco;
    }

    return soma;
  }

  bool get vazio => itens.isEmpty;
}
