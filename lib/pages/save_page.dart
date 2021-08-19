import 'package:flutter/material.dart';
import 'package:todoapp_08/models/todo_model.dart';
import 'package:todoapp_08/pages/list_page.dart';
import 'package:todoapp_08/todos_bloc.dart';
import 'package:todoapp_08/widgets/custom_text_field.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = "/save";

  final TextEditingController nameEC = TextEditingController();
  final TextEditingController descriptionEC = TextEditingController();
  final TextEditingController completeEC = TextEditingController();
  final TextEditingController priorityEC = TextEditingController();

  final TodosBloc todosBloc; //= TodosBloc();

  SavePage() : todosBloc = TodosBloc();

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context)!.settings.arguments == null
        ? Todo.empty()
        : ModalRoute.of(context)!.settings.arguments  as Todo;

    if (todo.id != 0) {
      nameEC.text = todo.name;
      descriptionEC.text = todo.description;
      completeEC.text = todo.completeBy;
      priorityEC.text = todo.priority.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.id == 0 ? "Crear Todo" : todo.name),
      ),
      body: Card(
          child: Column(
        children: [
          CustomTextField(
            placeholder: "Nombre",
            icon: Icons.list,
            controller: nameEC,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            placeholder: "Description",
            icon: Icons.description,
            controller: descriptionEC,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            placeholder: "Completado",
            icon: Icons.check,
            controller: completeEC,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            placeholder: "Prioridad",
            icon: Icons.star,
            type: TextInputType.number,
            controller: priorityEC,
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
              child: Text(todo.id == 0 ? "Insertar" : "Actualizar"),
              onPressed: () {
                todo.name = nameEC.text;
                todo.description = descriptionEC.text;
                todo.completeBy = completeEC.text;
                try {
                  todo.priority = int.tryParse(priorityEC.text) ?? 0;
                } catch (e) {
                  todo.priority = 1;
                }

                if (todo.id == 0)
                  todosBloc.todoInsertSink.add(todo);
                else
                  todosBloc.todoUpdateSink.add(todo);

                Navigator.pop(context);
               /* Navigator.pushNamedAndRemoveUntil(
                    context, ListPage.ROUTE, (route) => false);*/
              })
        ],
      )),
    );
  }
}
