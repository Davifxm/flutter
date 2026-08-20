import 'package:test/test.dart';

import '../lib/jogo.dart';
import '../lib/catalogo_repository.dart';
import '../lib/carrinho.dart';

void main() {
  test('Jogo encontrado no catálogo pode ser adicionado ao carrinho', () {
    final catalogo = CatalogoRepository();

    catalogo.adicionar(Jogo('RPG01', 'Kingdom Legacy', 59.90));

    final jogo = catalogo.buscarPorId('RPG01');

    final carrinho = Carrinho();

    carrinho.adicionar(jogo);

    expect(carrinho.itens.length, 1);

    expect(carrinho.total(), 59.90);
  });
}
