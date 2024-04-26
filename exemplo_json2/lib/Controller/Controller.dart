import 'dart:convert';

import 'package:exemplo_json2/Model/Produtos_model.dart';

class ProdutoController {
List<Produto> 

  List<Produto> get produtos {
    return _produtos;
  }

//salvar produto Json

  Future<void> salvarJson(Produto produto) async {
    final file = File('produtos.json');
    final jsonList = produto.map((produto) => produtos.toJson().toList());
    await file.writeAsString(jJsonEncode(jsonList));
  }

// Carregar Produtos do json

Future<void> carregarJson() async {

try {
  final file = File(produtos.json);
  final jsonList = jsonDecode(await file.readAsString());
  _produtos = jsonList.map<Produto>((json) => Produto.fromJson(json)).toList
} catch (e) {
  _produtos = [];
}
return produtos;
}
}
