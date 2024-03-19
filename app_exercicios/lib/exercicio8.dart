//Exercicio 8

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'), // Título da barra de aplicativo
      ),
      body: ListView(
        padding: EdgeInsets.all(16), // Padding para a ListView
        // Lista de cards que exibirão informações dos produtos
        children: <Widget>[
          ProductCard(
            imageUrl: 'assets/product1.jpg',
            title: 'Produto 1',
            description: 'Descrição do Produto 1',
          ),
          ProductCard(
            imageUrl: 'assets/product2.jpg',
            title: 'Produto 2',
            description: 'Descrição do Produto 2',
          ),
          ProductCard(
            imageUrl: 'assets/product3.jpg',
            title: 'Produto 3',
            description: 'Descrição do Produto 3',
          ),
          // Adicione mais cards conforme necessário
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ProductCard({
    Key key,
    this.imageUrl,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Elevação do card
      margin: EdgeInsets.symmetric(vertical: 8), // Margem vertical
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Imagem do produto
          Image.asset(
            imageUrl,
            fit: BoxFit.cover, // Ajuste da imagem ao card
          ),
          // Título do produto
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold), // Estilo do título
            ),
            // Descrição do produto
            subtitle: Text(description), // Subtítulo do card
          ),
        ],
      ),
    );
  }
}
    