import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import './taskmodel.dart';

class NewTaskView extends StatefulWidget {
  final Todos todo;

  NewTaskView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return NewTaskViewState(todo);
  }
}

class NewTaskViewState extends State<NewTaskView> {
  String input;

  TextEditingController textEditingController;

  NewTaskViewState(Todos todo) {
    this.input = todo.input;

    textEditingController = TextEditingController(text: todo.input);

    textEditingController.addListener(() {
      setState(() {
        input = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: barColor,
          elevation: 20,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'ADD ACTIVITY',
              style: TextStyle(color: bgColor, fontSize: 40,
              ),
            ),
          ),
          ),
        ),
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 32),
            _textInputField(),
            _raisedButton(),
          ],
        ),
      ),
    );
  }

  Widget _textInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'Write your task here...',

          filled: true,
          fillColor: Colors.white,
        
          ),
        ),
    );
  }

  Widget _raisedButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: barColor,
        textColor: Colors.white,
        label: Text('ADD'),
        onPressed: () {
          Navigator.pop(context, Todos(input: input));
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}