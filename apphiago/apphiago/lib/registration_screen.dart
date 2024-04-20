import 'package:flutter/material.dart';
import 'package:apphiago/usuario.dart';
import 'package:apphiago/usuario_controller.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UsuarioController _usuarioController = UsuarioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                Usuario newUser = Usuario(nomeDeUsuario: username, senha: password);
                _usuarioController.salvarUsuario(newUser);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Cadastro realizado com sucesso!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
