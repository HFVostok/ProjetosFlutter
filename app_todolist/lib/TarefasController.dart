import 'package:app_todolist/TarefasModel.dart';
import 'package:flutter/material.dart';

class TarefasController extends ChangeNotifier {
  //Lista de Tarefas

  List<Tarefas> _tarefas = [];
  List<Tarefas> get tarefas => _tarefas;

  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefas(descricao, false));
      notifyListeners();
    } else {}
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  void marcarComoNaoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = false;
      notifyListeners();
    }
  }

// metodo para excluir uma tarefa com base no indice

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }

//   String getData() {

//     return DataFormat('dd/MM/yyyy').format();
//   }
 }
