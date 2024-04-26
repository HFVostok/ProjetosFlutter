import 'dart:convert'; // Importe essa linha para usar o json.decode

class Produto {
  final int id;
  final String nome;
  final String descricao;
  final String foto;
  final String quantidade;
  final String preco;
  final List<String> categorias; // Corrigido para uma lista de strings

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.foto,
    required this.quantidade,
    required this.preco,
    required this.categorias,
  });

  // Método toJson para serializar o objeto
  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'descricao': descricao,
        'foto': foto,
        'quantidade': quantidade,
        'preco': preco,
        'categorias': categorias,
      };

  // Método factory fromJson para desserializar o JSON em um objeto Produto
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] as int,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      foto: json['foto'] as String,
      quantidade: json['quantidade'] as String,
      preco: json['preco'] as String,
      categorias: List<String>.from(json['categorias'] as List<dynamic>),
    );
  }
}

