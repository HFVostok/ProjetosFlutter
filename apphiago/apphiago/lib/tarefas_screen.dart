import 'package:flutter/material.dart';
import 'package:apphiago/controller.dart';
import 'package:apphiago/modelo.dart';

class TarefasScreen extends StatefulWidget {
  final String username;

  TarefasScreen({required this.username});

  @override
  _TarefasScreenState createState() => _TarefasScreenState();
}

class _TarefasScreenState extends State<TarefasScreen> {
  final TarefaController _tarefaController = TarefaController();
  final TextEditingController _novaTarefaController = TextEditingController();
  late List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    try {
      List<Tarefa> tarefas = await _tarefaController.listarTarefas();
      setState(() {
        _tarefas = tarefas;
      });
    } catch (e) {
      print('Erro ao carregar tarefas: $e');
      // Exiba um diálogo de erro ou mensagem adequada ao usuário
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Erro ao carregar as tarefas. Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas de ${widget.username}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tarefas[index].descricao),
                  leading: Checkbox(
                    value: _tarefas[index].concluida,
                    onChanged: (value) {
                      _atualizarStatusTarefa(_tarefas[index], value ?? false);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removerTarefa(_tarefas[index].id!);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _novaTarefaController,
                    decoration: InputDecoration(
                      labelText: 'Nova Tarefa',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _adicionarTarefa,
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _adicionarTarefa() async {
    String descricao = _novaTarefaController.text;
    if (descricao.isNotEmpty) {
      Tarefa novaTarefa = Tarefa(descricao: descricao, concluida: false);
      try {
        await _tarefaController.salvarTarefa(novaTarefa);
        _novaTarefaController.clear();
        await _carregarTarefas();
      } catch (e) {
        print('Erro ao adicionar nova tarefa: $e');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erro'),
            content: Text('Erro ao adicionar a nova tarefa. Por favor, tente novamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fechar o diálogo
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _atualizarStatusTarefa(Tarefa tarefa, bool concluida) async {
    tarefa.concluida = concluida;
    try {
      await _tarefaController.editarTarefa(tarefa);
      await _carregarTarefas();
    } catch (e) {
      print('Erro ao atualizar status da tarefa: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Erro ao atualizar o status da tarefa. Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _removerTarefa(int id) async {
    try {
      await _tarefaController.removerTarefa(id);
      await _carregarTarefas();
    } catch (e) {
      print('Erro ao remover a tarefa: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Erro ao remover a tarefa. Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _novaTarefaController.dispose();
    super.dispose();
  }
}
