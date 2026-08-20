class Jogo {
  final String id;
  final String titulo;
  final double preco;

  Jogo(this.id, this.titulo, this.preco);

  bool get gratuito => preco <= 0;
}
