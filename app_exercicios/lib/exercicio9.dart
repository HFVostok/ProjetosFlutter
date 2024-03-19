// Exercicio 9
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout com Abas (TabBar)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabPage(),
    );
  }
}

class MyTabPage extends StatefulWidget {
  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inicializa o TabController com 3 abas
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Libera os recursos do TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Layout com Abas (TabBar)'), // Título da barra de aplicativo
        bottom: TabBar(
          controller: _tabController, // Controlador das abas
          tabs: [
            Tab(text: 'Aba 1'), // Título da primeira aba
            Tab(text: 'Aba 2'), // Título da segunda aba
            Tab(text: 'Aba 3'), // Título da terceira aba
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Controlador das abas
        children: [
          // Conteúdo exclusivo da primeira aba
          Center(
            child: Text('Conteúdo da Aba 1'),
          ),
          // Conteúdo exclusivo da segunda aba
          Center(
            child: Text('Conteúdo da Aba 2'),
          ),
          // Conteúdo exclusivo da terceira aba
          Center(
            child: Text('Conteúdo da Aba 3'),
          ),
        ],
      ),
    );
  }
}
