import 'package:app_lista_mercado/ItensModel.dart';
import 'package:flutter/material.dart';

class ItensController extends ChangeNotifier {
  List<ItensModel> _itens = [];
  List<ItensModel> get tarefas => _itens;

  String _mensagem = '';

  String get mensagem => _mensagem;


  void adicionarItem(String descricao) {
    // Verifica se a descrição não está vazia
    if (descricao.trim().isEmpty) {
      _mensagem = 'A descrição não pode estar vazia.';
      notifyListeners();
      return;
    }

    // Verifica se o item já está na lista
    if (_itens.any((item) => item.descricao == descricao)) {
      _mensagem = 'Item já está na lista.';
      notifyListeners();
      return;
    }

    // Adiciona o item à lista
    _itens.add(ItensModel(descricao, false));
    _mensagem = 'Item adicionado.';
    notifyListeners();
  }

  void limparMensagem() {
    _mensagem = '';
    notifyListeners();
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].concluida = true;
      notifyListeners();
    }
  }

  void marcarComoNaoConcluida(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].concluida = false;
      notifyListeners();
    }
  }

  void excluirItem(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens.removeAt(indice);
      notifyListeners();
    }
  }

  void aumentarQuantidade(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].quantidade++;
      notifyListeners();
    }
  }

  void diminuirQuantidade(int indice) {
    if (indice >= 0 &&
        indice < _itens.length &&
        _itens[indice].quantidade > 1) {
      _itens[indice].quantidade--;
      notifyListeners();
    }
  }

   void editarTarefa(int indice, String novaDescricao) {
    // Verifica se o índice está dentro dos limites da lista
    if (indice >= 0 && indice < _itens.length) {
      // Atualiza a descrição da tarefa no índice especificado
      _itens[indice].descricao = novaDescricao;
      _mensagem = 'Tarefa editada com sucesso.';
      notifyListeners();
    }
  }

  void marcarComoComprado(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].comprado = true;
      notifyListeners();
    }
  }

}
