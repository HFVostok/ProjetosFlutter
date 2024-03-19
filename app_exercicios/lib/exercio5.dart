//Exercicio 4

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Índice da aba selecionada

  // Lista de widgets de páginas correspondentes a cada aba
  final List<Widget> _pages = [
    HomePage(), // Página inicial
    ProfilePage(), // Página do perfil
    FormPage(), // Página do formulário
  ];

  // Método para alternar entre as abas
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aplicação'),
      ),
      body: _pages[_selectedIndex], // Exibe a página selecionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice da aba selecionada
        onTap: _onItemTapped, // Função chamada quando uma aba é pressionada
        items: [
          // Definição das abas da barra de navegação
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ícone da aba "Início"
            label: 'Início', // Rótulo da aba "Início"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ícone da aba "Perfil"
            label: 'Perfil', // Rótulo da aba "Perfil"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit), // Ícone da aba "Formulário"
            label: 'Formulário', // Rótulo da aba "Formulário"
          ),
        ],
      ),
    );
  }
}

// Página inicial
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página Inicial'), // Conteúdo da página inicial
    );
  }
}

// Página do perfil
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página de Perfil'), // Conteúdo da página de perfil
    );
  }
}

// Nova página para o formulário
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Digite algo', // Rótulo do campo de texto
            ),
          ),
          SizedBox(height: 20), // Espaçamento entre o campo de texto e o botão
          ElevatedButton(
            onPressed: () {
              // Ação a ser executada ao clicar no botão
              print('Formulário submetido!');
            },
            child: Text('Submeter'), // Texto do botão
          ),
        ],
      ),
    );
  }
}
