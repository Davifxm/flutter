class Usuario {
  String id;
  String nome;
  String email;
  double saldo;
  bool autenticado;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.saldo,
    this.autenticado = false,
  });

  void debitar(double valor) {
    saldo = saldo - valor;
  }

  bool possuiSaldo(double valor) {
    return saldo >= valor;
  }
}
