import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Inicializa a aplicação Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Construtor da classe MyApp
  @override
  Widget build(BuildContext context) {
    // Método responsável por construir a interface da aplicação
    return MaterialApp(
      // Retorna um widget MaterialApp que configura a aplicação
      title: "Exemplo SQLLite", // Título da aplicação
      theme: ThemeData(primarySwatch: Colors.blue), // Tema da aplicação
      home: HomePage(), // Página inicial da aplicação
    );
  }
}
