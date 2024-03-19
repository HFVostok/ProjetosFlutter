//Exercico 3

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Lista de itens fictícios
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView with Cards Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView with Cards Demo'),
        ),
        body: ListView.builder(
          // O número de itens é determinado pelo comprimento da lista de itens
          itemCount: items.length,
          // O itemBuilder é chamado para cada item na lista
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                // O número do item é exibido dentro de um CircleAvatar
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // O título é o nome do item
                title: Text('Item ${index + 1}'),
                // O subtítulo é uma descrição fictícia do item
                subtitle: Text('Descrição do item ${index + 1}'),
                // Ao clicar em um item, esta função é chamada
                onTap: () {
                  // Exemplo de ação ao clicar em um item
                  print('Clicou no item ${index + 1}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
