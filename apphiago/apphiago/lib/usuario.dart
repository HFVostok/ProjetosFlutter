// usuario.dart

class Usuario {
  final String nomeDeUsuario;
  final String senha;

  Usuario({
    required this.nomeDeUsuario,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomeDeUsuario': nomeDeUsuario,
      'senha': senha,
    };
  }
}
