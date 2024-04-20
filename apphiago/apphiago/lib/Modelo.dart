class Tarefa {
  int? id;
  String descricao;
  bool concluida;

  Tarefa({
    this.id,
    required this.descricao,
    this.concluida = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'concluida': concluida ? 1 : 0,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      descricao: map['descricao'],
      concluida: map['concluida'] == 1,
    );
  }
}
