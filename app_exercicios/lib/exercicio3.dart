//Exercico 3

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView with Cards Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de itens fictícios
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  // Variável para armazenar o índice do item selecionado na barra de navegação
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Cards Demo'),
      ),
      // Corpo do Scaffold
      body: _buildBody(), // Método para construir o corpo da tela
      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap:
            _onItemTapped, // Método chamado ao selecionar um item na barra de navegação
        // Itens da barra de navegação
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  // Método para construir o corpo da tela com base no item selecionado na barra de navegação
  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildListView(); // Lista de itens
      case 1:
        return Center(
          child: Text('Search Screen'), // Tela de pesquisa
        );
      case 2:
        return Center(
          child: Text('Favorites Screen'), // Tela de favoritos
        );
      default:
        return Container(); // Se nenhum índice corresponder, retorna um contêiner vazio
    }
  }

  // Método para construir a lista de itens
  Widget _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Descrição do item ${index + 1}'),
            onTap: () {
              print('Clicou no item ${index + 1}');
            },
          ),
        );
      },
    );
  }

  // Método chamado ao selecionar um item na barra de navegação
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice do item selecionado
    });
  }
}
