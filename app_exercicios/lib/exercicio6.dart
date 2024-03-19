// Exercio 6

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Contato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactForm(),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String message = _messageController.text;

    print('Nome: $name');
    print('E-mail: $email');
    print('Mensagem: $message');

    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Obtém as informações de tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define os tamanhos dos campos de acordo com o tamanho da tela
    final fieldWidth = screenWidth * 0.8;
    final buttonWidth = screenWidth * 0.5;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Contato'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.05), // Espaçamento superior
            Container(
              width: fieldWidth,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Espaçamento entre campos
            Container(
              width: fieldWidth,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Espaçamento entre campos
            Container(
              width: fieldWidth,
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Mensagem',
                ),
                maxLines: 4,
              ),
            ),
            SizedBox(
                height:
                    screenHeight * 0.02), // Espaçamento entre campos e botão
            Container(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
