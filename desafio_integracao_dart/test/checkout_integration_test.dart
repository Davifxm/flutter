import 'package:test/test.dart';

import '../lib/usuario.dart';
import '../lib/autenticacao_service.dart';
import '../lib/jogo.dart';
import '../lib/catalogo_repository.dart';
import '../lib/estoque_service.dart';
import '../lib/carrinho.dart';
import '../lib/pagamento_service.dart';
import '../lib/pedido_repository.dart';
import '../lib/checkout_service.dart';
import '../lib/pedido.dart';

void main() {
  group('Integração completa de compra de jogos', () {
    test('Usuário autenticado compra jogo com saldo suficiente', () {
      final usuario = Usuario(
        id: 'U1',
        nome: 'Ana',
        email: 'ana@email.com',
        saldo: 200.0,
      );

      final autenticacao = AutenticacaoService();

      final jogo = Jogo(
        'G1',
        'Cyber Dungeon',
        80.0,
      );

      final catalogo = CatalogoRepository();
      catalogo.adicionar(jogo);

      final estoque = EstoqueService();
      estoque.adicionarLicencas('G1', 2);

      final carrinho = Carrinho();
      carrinho.adicionar(jogo);

      final pagamento = PagamentoService();
      final pedidos = PedidoRepository();

      final checkout = CheckoutService(
        estoque,
        pagamento,
        pedidos,
      );

      autenticacao.login(usuario, '123456');

      final pedido = checkout.finalizar(usuario, carrinho);

      expect(pedido.status, PedidoStatus.aprovado);

      expect(pedido.valorTotal, 80);

      expect(usuario.saldo, 120);

      expect(estoque.quantidade('G1'), 1);

      expect(pedidos.quantidade, 1);
    });

    test('Compra deve ser recusada quando usuário não possui saldo', () {
      final usuario = Usuario(
        id: 'U2',
        nome: 'Carlos',
        email: 'carlos@email.com',
        saldo: 20.0,
      );

      final autenticacao = AutenticacaoService();

      final jogo = Jogo('G2', 'Space Arena', 100.0);

      final estoque = EstoqueService();
      estoque.adicionarLicencas('G2', 1);

      final carrinho = Carrinho();
      carrinho.adicionar(jogo);

      final pagamento = PagamentoService();
      final pedidos = PedidoRepository();

      final checkout = CheckoutService(
        estoque,
        pagamento,
        pedidos,
      );

      autenticacao.login(usuario, '123456');

      final pedido = checkout.finalizar(usuario, carrinho);

      expect(
        pedido.status,
        PedidoStatus.recusado,
      );

      expect(usuario.saldo, 20);

      expect(
        estoque.quantidade('G2'),
        1,
      );
    });

    test('Compra deve falhar quando não existe licença disponível', () {
      final usuario = Usuario(
        id: 'U3',
        nome: 'Marina',
        email: 'marina@email.com',
        saldo: 500.0,
      );

      final jogo = Jogo('G3', 'Racing Pro', 150.0);

      final estoque = EstoqueService();

      estoque.adicionarLicencas(
        'G3',
        0,
      );

      final carrinho = Carrinho();

      carrinho.adicionar(jogo);

      final pagamento = PagamentoService();

      final pedidos = PedidoRepository();

      final checkout = CheckoutService(
        estoque,
        pagamento,
        pedidos,
      );

      expect(
        () => checkout.finalizar(
          usuario,
          carrinho,
        ),
        throwsException,
      );
    });

    test('Dois jogos devem produzir o total correto', () {
      final usuario = Usuario(
        id: 'U4',
        nome: 'Lucas',
        email: 'lucas@email.com',
        saldo: 300.0,
      );

      final autenticacao = AutenticacaoService();

      autenticacao.login(
        usuario,
        '123456',
      );

      final jogo1 = Jogo('G10', 'Jogo A', 50.0);

      final jogo2 = Jogo('G11', 'Jogo B', 70.0);

      final carrinho = Carrinho();

      carrinho.adicionar(jogo1);
      carrinho.adicionar(jogo2);

      final estoque = EstoqueService();

      estoque.adicionarLicencas(
        'G10',
        1,
      );

      estoque.adicionarLicencas(
        'G11',
        1,
      );

      final checkout = CheckoutService(
        estoque,
        PagamentoService(),
        PedidoRepository(),
      );

      final pedido = checkout.finalizar(
        usuario,
        carrinho,
      );

      expect(
        pedido.valorTotal,
        120,
      );

      expect(
        usuario.saldo,
        180,
      );
    });
  });
}
