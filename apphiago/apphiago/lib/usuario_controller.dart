// usuario_controller.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:apphiago/usuario.dart'; // Importe corretamente a classe Usuario

class UsuarioController {
  Future<Database> _getDatabase() async {
    String path = join(await getDatabasesPath(), 'usuarios_database.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE usuarios(nomeDeUsuario TEXT PRIMARY KEY, senha TEXT)',
      );
    }, version: 1);
  }

  Future<void> salvarUsuario(Usuario usuario) async {
    final Database db = await _getDatabase();
    await db.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> validarUsuario(String nomeDeUsuario, String senha) async {
    final Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'usuarios',
      where: 'nomeDeUsuario = ? AND senha = ?',
      whereArgs: [nomeDeUsuario, senha],
    );
    return result.isNotEmpty;
  }
}
