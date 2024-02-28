import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_mercado/ItensController.dart';

class ItensScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      backgroundColor: Colors.yellow[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Novo Item',
                      suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<ItensController>(context, listen: false)
                              .adicionarItem(_controller.text);
                          _controller.clear();
                          _exibirSnackBar(
                              context, 'Item adicionado com sucesso');
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<ItensController>(
            builder: (context, model, child) {
              return model.mensagem.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(model.mensagem),
                    )
                  : SizedBox();
            },
          ),
          Expanded(
            child: Consumer<ItensController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(model.tarefas[index].descricao),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              Provider.of<ItensController>(context,
                                      listen: false)
                                  .diminuirQuantidade(index);
                              _exibirSnackBar(context, 'Quantidade reduzida');
                            },
                          ),
                          Text('${model.tarefas[index].quantidade}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              Provider.of<ItensController>(context,
                                      listen: false)
                                  .aumentarQuantidade(index);
                              _exibirSnackBar(context, 'Quantidade aumentada');
                            },
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _exibirDialogoEdicao(context, index, model);
                            },
                          ),
                          Checkbox(
                            value: model.tarefas[index].concluida,
                            onChanged: (value) {
                              if (value != null) {
                                Provider.of<ItensController>(context,
                                        listen: false)
                                    .marcarComoConcluida(index);
                                _exibirSnackBar(
                                    context, 'Tarefa marcada como concluída');
                              } else {
                                Provider.of<ItensController>(context,
                                        listen: false)
                                    .marcarComoNaoConcluida(index);
                                _exibirSnackBar(context,
                                    'Tarefa marcada como não concluída');
                              }
                            },
                          ),
                        ],
                      ),
                      onLongPress: () {
                        Provider.of<ItensController>(context, listen: false)
                            .excluirItem(index);
                        _exibirSnackBar(context, 'Item excluído');
                      },
                      onTap: () {
                        Provider.of<ItensController>(context, listen: false)
                            .marcarComoComprado(index);
                        _exibirSnackBar(context, 'Item marcado como comprado');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _exibirDialogoEdicao(
      BuildContext context, int index, ItensController model) {
    TextEditingController controller = TextEditingController();
    controller.text = model.tarefas[index].descricao;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Nova Descrição'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _exibirSnackBar(context, 'Edição cancelada');
              },
              child: Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                model.editarTarefa(index, controller.text);
                Navigator.pop(context);
                _exibirSnackBar(context, 'Tarefa editada com sucesso');
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _exibirSnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.lightBlueAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
