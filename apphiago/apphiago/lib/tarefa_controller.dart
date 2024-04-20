import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:apphiago/modelo.dart';

class TarefaController {
  Future<Database> _getDatabase() async {
    String path = join(await getDatabasesPath(), 'tarefas_database.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tarefas(id INTEGER PRIMARY KEY, descricao TEXT, concluida INTEGER)',
      );
    }, version: 1);
  }

  Future<void> salvarTarefa(Tarefa tarefa) async {
    final Database db = await _getDatabase();
    await db.insert(
      'tarefas',
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tarefa>> listarTarefas() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('tarefas');
    return List.generate(maps.length, (index) {
      return Tarefa.fromMap(maps[index]);
    });
  }

  Future<void> editarTarefa(Tarefa tarefa) async {
    final Database db = await _getDatabase();
    await db.update(
      'tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  Future<void> removerTarefa(int id) async {
    final Database db = await _getDatabase();
    await db.delete(
      'tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
