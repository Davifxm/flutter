import 'usuario.dart';
import 'carrinho.dart';
import 'estoque_service.dart';
import 'pagamento_service.dart';
import 'pedido.dart';
import 'pedido_repository.dart';

class CheckoutService {
  final EstoqueService estoque;
  final PagamentoService pagamento;
  final PedidoRepository pedidos;

  CheckoutService(this.estoque, this.pagamento, this.pedidos);

  Pedido finalizar(Usuario usuario, Carrinho carrinho) {
    if (!usuario.autenticado) {
      throw Exception('Usuario nao autenticado');
    }

    if (carrinho.vazio) {
      throw Exception('Carrinho vazio');
    }

    for (final jogo in carrinho.itens) {
      if (!estoque.possuiLicenca(jogo.id)) {
        throw Exception('Jogo sem licenca');
      }
    }

    final total = carrinho.total();

    final pagamentoResultado = pagamento.processar(usuario, total);

    final pedido = Pedido(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      usuarioId: usuario.id,
      jogosIds: carrinho.itens.map((jogo) => jogo.id).toList(),
      valorTotal: total,
    );

    if (pagamentoResultado.aprovado) {
      pedido.aprovar();

      for (final jogo in carrinho.itens) {
        estoque.consumirLicenca(jogo.id);
      }
    } else {
      pedido.recusar();
    }

    pedidos.salvar(pedido);

    return pedido;
  }
}
