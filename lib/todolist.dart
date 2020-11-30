import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/taskmodel.dart';
import 'package:provider/provider.dart';
import './taskmodel.dart';

class ToDoList extends StatelessWidget {
  final List<Todos> list;

  ToDoList(this.list);
  bool isChecked = true;

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _itemTodo(context, todo)).toList());
  }

  Widget _itemTodo(context, todo) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: Checkbox(
            activeColor: barColor,
            focusColor: barColor,
            value: todo.done,
            onChanged: (bool newValue) {
              var state = Provider.of<MyState>(context, listen: false);
              state.checkTodo(todo, newValue);
            }),
        title: Text(
          todo.input != null ? todo.input : '',
          style: todo.done
          ? TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.black54
          )
          : TextStyle(
            decoration: TextDecoration.none,
          )
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.black54,
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTodo(todo);
          },
        ),
      ),
    );
  }
}