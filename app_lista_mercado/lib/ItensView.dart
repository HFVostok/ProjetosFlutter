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
                      title: Text(model.tarefas[index].descricao),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _exibirDialogoEdicao(context, index);
                            },
                          ),
                          Checkbox(
                            value: model.tarefas[index].concluida,
                            onChanged: (value) {
                              if (value != null) {
                                Provider.of<ItensController>(context,
                                        listen: false)
                                    .marcarComoConcluida(index);
                              } else {
                                Provider.of<ItensController>(context,
                                        listen: false)
                                    .marcarComoNaoConcluida(index);
                              }
                            },
                          ),
                        ],
                      ),
                      onLongPress: () {
                        Provider.of<ItensController>(context, listen: false)
                            .excluirItem(index);
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

  void _exibirDialogoEdicao(BuildContext context, int index) {
    TextEditingController controller = TextEditingController();
    controller.text = Provider.of<ItensController>(context, listen: false)
        .tarefas[index]
        .descricao;

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
            TextButton(
              onPressed: () {
                Provider.of<ItensController>(context, listen: false)
                    .editarTarefa(index, controller.text);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
