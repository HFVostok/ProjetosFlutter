import 'package:flutter/material.dart';
import 'package:apphiago/tarefas_screen.dart';
import 'package:apphiago/usuario_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UsuarioController _usuarioController = UsuarioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            SizedBox(height: 24.0),
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
              child: Text('Login'),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                bool isValid = await _usuarioController.validarUsuario(username, password);

                if (isValid) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TarefasScreen(username: username)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nome de usuário ou senha incorretos'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: Text('Não tem uma conta? Cadastre-se'),
              onPressed: () {
                // Implementar navegação para a tela de cadastro
              },
            ),
          ],
        ),
      ),
    );
  }
}
