import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:todoapp_08/models/todo_model.dart';

class TodoDb {
  static late Database _database;

  final todos = intMapStoreFactory.store('todos'); // tabla - carperta

  initDB() async{
    final docsPath = await getApplicationDocumentsDirectory();
    _database = await databaseFactoryIo
          .openDatabase(join(docsPath.path, 'todoapp', 'sembast', 'todos.db'));
  }

  Future<Database> get database async {
    /*final docsPath = await getApplicationDocumentsDirectory();

    if (_database == null) {
      _database = await databaseFactoryIo
          .openDatabase(join(docsPath.path, 'todoapp', 'sembast', 'todos.db'));
    }*/

    return _database;
  }

  Future insert(Todo todo) async {
    await todos.add(_database, todo.toMap());
  }

  Future<List<Todo>> getAll() async {

    final finder = Finder(sortOrders: [
      SortOrder('priority',false)
    ]);

    final todosSnapshot = await todos.find(_database, finder: finder);

    return todosSnapshot.map((snapshot) {
      final todo = Todo.fromMap(snapshot.value);
      todo.id = snapshot.key;
      return todo;
    }).toList();
  }

  Future delete(Todo todo) async {
    final finder = Finder(filter: Filter.byKey(todo.id));
    await todos.delete(_database, finder: finder);
  }

  Future update(Todo todo) async {
    final finder = Finder(filter: Filter.byKey(todo.id));
    await todos.update(_database, todo.toMap(), finder: finder);
  }

  Future<Todo?> getById(int id) async {
    final finder = Finder(filter: Filter.byKey(id));

    final snapshot = await todos.findFirst(_database, finder: finder);
    

    if(snapshot != null){

      final todo = Todo.fromMap(snapshot.value);
      todo.id = snapshot.key;
      return todo;
    }

    return null;

  }
}
