import 'package:exemplo_sqllite/Controller.dart'; // Importa o controlador do banco de dados
import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter
import 'package:exemplo_sqllite/View.dart'; // Importa a view para exibição dos contatos
import 'package:flutter/services.dart'; // Importa o pacote para acesso a serviços do sistema

import 'Model.dart'; // Importa o modelo de dados ContatoModel

class HomePage extends StatefulWidget { // Define a classe HomePage como um StatefulWidget
  const HomePage({super.key}); // Construtor da classe HomePage

  @override
  State<HomePage> createState() => _HomePageState(); // Cria o estado da HomePage
}

class _HomePageState extends State<HomePage> { // Define o estado da HomePage
  final dbHelper = BancoDadosCrud(); // Instância do controlador do banco de dados
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário
  
  // Controllers para os campos de texto
  TextEditingController _idController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) { // Método responsável por construir a interface da página
    return Scaffold( // Retorna um Scaffold, que define a estrutura básica da página
      appBar: AppBar( // Barra de aplicativo
        title: Text('SQLite Demo'), // Título da barra de aplicativo
      ),
      body: FutureBuilder<List<ContatoModel>>( // Corpo da página com um FutureBuilder para exibir a lista de contatos
        future: dbHelper.getContacts(), // Futuro que obtém a lista de contatos do banco de dados
        builder: (context, snapshot) { // Construtor do FutureBuilder
          if (snapshot.connectionState == ConnectionState.waiting) { // Se estiver carregando
            return Center(child: CircularProgressIndicator()); // Exibe um indicador de progresso no centro da tela
          } else if (snapshot.hasError) { // Se ocorrer um erro
            return Center(child: Text('Error: ${snapshot.error}')); // Exibe uma mensagem de erro no centro da tela
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) { // Se não houver dados ou a lista estiver vazia
            return Center(child: Text('Nenhum Contato Cadastrado')); // Exibe uma mensagem indicando que não há contatos cadastrados
          } else { // Se houver dados
            return ListView.builder( // Constrói uma lista de contatos
              itemCount: snapshot.data?.length, // Número de itens na lista
              itemBuilder: (context, index) { // Construtor de cada item da lista
                final contact = snapshot.data![index]; // Obtém o contato na posição index
                return ListTile( // Retorna um item da lista
                  title: Text(contact.nome), // Título do item com o nome do contato
                  subtitle: Text(contact.telefone), // Subtítulo do item com o telefone do contato
                  onTap: () {
                    //criar um método para Ver informações do contato
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton( // Botão flutuante para adicionar novo contato
        onPressed: () {
          _showAddContactDialog(context); // Exibe o diálogo para adicionar um novo contato
        },
        child: Icon(Icons.add), // Ícone do botão flutuante
      ),
    );
  }

  // Método para exibir um diálogo para adicionar um novo contato
  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType.number, // Define o tipo de teclado para numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly // Permite apenas a entrada de dígitos
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an ID';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid ID (only digits allowed)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                TextFormField(
                  controller: _enderecoController,
                  decoration: InputDecoration(labelText: 'Endereço'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact(); // Adiciona o contato ao banco de dados
                  Navigator.of(context).pop(); // Fecha o diálogo
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Método para adicionar um novo contato ao banco de dados
  void _addContact() {
    final newContact = ContatoModel(
      id: int.parse(_idController.text),
      nome: _nomeController.text,
      email: _emailController.text,
      telefone: _telefoneController.text,
      endereco: _enderecoController.text,
    );

    dbHelper.create(newContact); // Chama o método para adicionar o contato ao banco de dados
    setState(() {
      // Atualiza a lista de contatos
    });
  }
}
