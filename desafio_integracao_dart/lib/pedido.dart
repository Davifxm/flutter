enum PedidoStatus { pendente, aprovado, recusado }

class Pedido {
  final String id;
  final String usuarioId;
  final List<String> jogosIds;
  final double valorTotal;
  PedidoStatus status;

  Pedido({
    required this.id,
    required this.usuarioId,
    required this.jogosIds,
    required this.valorTotal,
    this.status = PedidoStatus.pendente,
  });

  void aprovar() {
    status = PedidoStatus.aprovado;
  }

  void recusar() {
    status = PedidoStatus.recusado;
  }
}
