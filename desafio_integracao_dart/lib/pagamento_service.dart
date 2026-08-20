import 'usuario.dart';

class PagamentoResultado {
  final bool aprovado;
  final String mensagem;

  PagamentoResultado(this.aprovado, this.mensagem);
}

class PagamentoService {
  PagamentoResultado processar(Usuario usuario, double valor) {
    if (usuario.possuiSaldo(valor)) {
      usuario.debitar(valor);

      return PagamentoResultado(true, 'Pagamento aprovado');
    }

    return PagamentoResultado(false, 'Saldo insuficiente');
  }
}
