import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/main.dart';

import 'newtaskview.dart';
import 'taskmodel.dart';
import 'todolist.dart';

class HomePage extends StatefulWidget {
  HomePage({this.homePage});

  final String homePage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
            backgroundColor: barColor,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'TO DO LIST',
                style: TextStyle(
                  color: bgColor, fontSize: 40,
                ),
              ),
            ),
            actions: [
              PopupMenuButton(
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  })
            ]),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => ToDoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: barColor,
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTaskView(Todos(input: ''))));
          //Lägger till Todo i listan av Todos.
          Provider.of<MyState>(context, listen: false).addTodo(newTodo);
        },
      ),
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.All) {
    print('All');
  } else if (choice == Constants.Done) {
    print('Done');
  } else if (choice == Constants.Undone) {
    print('Undone');
  }
}

  
class Constants {
  static const List<String> choices = <String>[All, Done, Undone];
  static const String All = 'All';
  static const String Done = 'Done';
  static const String Undone = 'Undone';
  

  
}