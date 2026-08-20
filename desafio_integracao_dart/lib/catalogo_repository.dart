import 'jogo.dart';

class CatalogoRepository {
  final List<Jogo> jogos = [];

  void adicionar(Jogo jogo) {
    jogos.add(jogo);
  }

  Jogo buscarPorId(String id) {
    return jogos.firstWhere((jogo) => jogo.id == id);
  }

  bool existe(String id) {
    return jogos.any((jogo) => jogo.id == id);
  }
}
