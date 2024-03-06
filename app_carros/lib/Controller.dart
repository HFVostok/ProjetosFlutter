
import 'package:app_carros/Model.dart';

class CarroController {
  // atributo
  List<Carro> _carrosLista = [
Carro("Fiat Uno",1990,"Carro imagem")

  ];
  // metodo

  List<Carro> get listarCarros => _carrosLista;

  // outros metodos

  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carrosLista.add(carro);
  }
}
