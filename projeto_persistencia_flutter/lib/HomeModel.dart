class ContatoModel { // Definição da classe ContatoModel
  // Atributos do modelo de contato
  int id; // Identificador do contato
  String nome; // Nome do contato
  String email; // Endereço de e-mail do contato
  String telefone; // Número de telefone do contato
  String endereco; // Endereço do contato
  
  // Construtor da classe ContatoModel
  ContatoModel({ // Define o construtor da classe com os parâmetros obrigatórios
    required this.id, // ID é obrigatório
    required this.nome, // Nome é obrigatório
    required this.email, // Email é obrigatório
    required this.telefone, // Telefone é obrigatório
    required this.endereco, // Endereço é obrigatório
  });
  
  // Método para mapear os atributos do contato para um mapa
  Map<String, dynamic> toMap() { // Retorna um mapa com os atributos do contato
    return {
      'id': id, // Chave 'id' com o valor do ID
      'nome': nome, // Chave 'nome' com o valor do nome
      'email': email, // Chave 'email' com o valor do email
      'telefone': telefone, // Chave 'telefone' com o valor do telefone
      'endereco': endereco, // Chave 'endereco' com o valor do endereço
    };
  }
  
  // Fábrica para criar um objeto ContatoModel a partir de um mapa
  factory ContatoModel.fromMap(Map<String, dynamic> map) { // Método de fábrica para criar um ContatoModel a partir de um mapa
    return ContatoModel( // Retorna uma nova instância de ContatoModel com os valores do mapa
      id: map['id'], // Obtém o ID do mapa
      nome: map['nome'], // Obtém o nome do mapa
      email: map['email'], // Obtém o email do mapa
      telefone: map['telefone'], // Obtém o telefone do mapa
      endereco: map['endereco'], // Obtém o endereço do mapa
    );
  }
}
