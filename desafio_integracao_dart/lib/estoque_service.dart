class EstoqueService {
  final Map<String, int> licencas = {};

  void adicionarLicencas(String jogoId, int quantidade) {
    licencas[jogoId] = quantidade;
  }

  bool possuiLicenca(String jogoId) {
    return (licencas[jogoId] ?? 0) > 0;
  }

  void consumirLicenca(String jogoId) {
    final quantidade = licencas[jogoId] ?? 0;

    if (quantidade <= 0) {
      return;
    }

    licencas[jogoId] = quantidade - 1;
  }

  int quantidade(String jogoId) {
    return licencas[jogoId] ?? 0;
  }
}
