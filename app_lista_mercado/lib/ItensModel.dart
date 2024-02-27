class ItensModel {
  String descricao;
  bool concluida;
  int quantidade; // Adicionando a propriedade quantidade

  ItensModel(this.descricao, this.concluida,
      {this.quantidade = 0}); // Inicializando a quantidade como 0
}