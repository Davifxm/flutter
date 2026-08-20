import 'pedido.dart';

class PedidoRepository {
  final List<Pedido> pedidos = [];

  void salvar(Pedido pedido) {
    pedidos.add(pedido);
  }

  Pedido? buscarPorId(String id) {
    for (final pedido in pedidos) {
      if (pedido.id == id) {
        return pedido;
      }
    }

    return null;
  }

  int get quantidade => pedidos.length;
}
