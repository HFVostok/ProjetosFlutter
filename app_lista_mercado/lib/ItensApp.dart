import 'package:app_lista_mercado/ItensController.dart';
import 'package:app_lista_mercado/ItensView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        //define a tela incial como tarefa

        home: ChangeNotifierProvider(
      create: (context) => ItensController(),
      child: ItensScreen(),
    ));
  }
}
