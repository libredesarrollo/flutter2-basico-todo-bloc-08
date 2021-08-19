import 'package:flutter/material.dart';
import 'package:todoapp_08/helpers/todo_db.dart';
import 'package:todoapp_08/models/todo_model.dart';
import 'package:todoapp_08/pages/list_page.dart';
import 'package:todoapp_08/pages/save_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  TodoDb todoDb = TodoDb();
  await todoDb.initDB();
  await todoDb.database;

  //todoDb.insert(Todo("Todo Test 3", "Todo test description 3", "Por Mi", 10));

  //final List<Todo> todos = await todoDb.getAll();

  //todos.forEach((t) {
  //print("${t.id.toString()} - ${t.name} ${t.description} ${t.completeBy} ${t.priority.toString()} ");
  //});

  /*final todo = await todoDb.getById(2);
  print(todo.name);*/

  //todoDb.delete(todos[0]);
  //todos[0].name = "Todo Modificado";
  //todoDb.update(todos[0]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      initialRoute: ListPage.ROUTE,
      routes: {
        ListPage.ROUTE: (_) => ListPage(),
        SavePage.ROUTE: (_) => SavePage(),
      },
    );
  }
}
