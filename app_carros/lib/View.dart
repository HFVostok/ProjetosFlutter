import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller.dart';

class TelaListaCarros extends StatelessWidget {
  final CarroController controllerCarros;
  TelaListaCarros(this.controllerCarros);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Meus Carros'),
      ),
// Corpo principal do aplicativo
      body: Column(children: [
// os Carros da Lista
//Consumer<CarroController>(
//builder: (context, model, child) {
//return
        ListView.builder(
          itemCount: controllerCarros.listarCarros.length,
          itemBuilder: (context, index) {
            return ListTile(
// Exibe os Carros Listados no Controller
              title: Text(controllerCarros.listarCarros[index].modelo),
//quando clicado o carro vai abrir a telaDescricaoCarro
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TelaDetalheCarro(controllerCarros.listarCarros[index]),
                  ),
                );
              },
            );
          },
        ),
      ]
// },
//)
          ),
    );
  }
}
