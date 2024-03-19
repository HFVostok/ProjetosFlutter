//Exercicio 7

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Lateral (Drawer) Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Lateral (Drawer) Demo'),
        // Adiciona um botão de menu na barra de aplicativo
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Abre o Drawer quando o botão é pressionado
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      // Define o Drawer para o menu lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Cabeçalho do Drawer
            DrawerHeader(
              child: Text(
                'Opções',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // Opções do Drawer
            ListTile(
              title: Text('Opção 1'),
              onTap: () {
                // Implemente a lógica para a opção 1 aqui
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Opção 2'),
              onTap: () {
                // Implemente a lógica para a opção 2 aqui
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Opção 3'),
              onTap: () {
                // Implemente a lógica para a opção 3 aqui
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            // Adicione mais ListTile para mais opções
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da Página'),
      ),
    );
  }
}
