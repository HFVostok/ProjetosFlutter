import 'package:flutter/material.dart';
import 'package:projeto_persistencia_flutter/HomeController.dart'; // Importando o arquivo onde estão os métodos de login e cadastro




class HomeView extends StatefulWidget {
 const HomeView({super.key}); // Construtor da classe HomePage

  @override
   State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Chamar método para fazer login
                HomeController.fazerLogin(
                  _usernameController.text,
                  _passwordController.text,
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: () {
                // Chamar método para se cadastrar
                HomeController.fazerCadastro(
                  _usernameController.text,
                  _passwordController.text,
                );
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}