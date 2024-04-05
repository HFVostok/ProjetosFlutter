import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto_persistencia_flutter/HomeModel.dart'; // Importe o modelo de dados ContatoModel

class BancoDadosCrud {
  static const String DB_NOME = 'contatos.db';
  static const String TABLE_NOME = 'contatos';
  static const String CREATE_CONTATOS_TABLE_SCRIPT =
      "CREATE TABLE IF NOT EXISTS contatos(id INTEGER PRIMARY KEY AUTOINCREMENT," +
          "nome TEXT, email TEXT, telefone TEXT," +
          "endereco TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME),
      onCreate: (db, version) {
        return db.execute(CREATE_CONTATOS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future<void> cadastrarContato(ContatoModel contato) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NOME, contato.toMap());
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<ContatoModel>> listarContatos() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NOME);

      return List.generate(
        maps.length,
        (i) {
          return ContatoModel.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}
