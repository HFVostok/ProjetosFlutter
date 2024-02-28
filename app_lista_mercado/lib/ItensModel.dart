class ItensModel {
  String descricao;
  bool concluida;
  int quantidade;
  bool comprado;

  ItensModel(this.descricao, this.concluida, {this.comprado = false, this.quantidade = 0});
}
