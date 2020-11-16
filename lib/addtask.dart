import 'package:flutter/material.dart';
import 'package:todolist/main.dart';


class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: bgColor,
      appBar: AppBar(
     backgroundColor: barColor,
        centerTitle: true, 
          title: Text('ADD ACTIVITY',
          style: TextStyle(color: Colors.black54)
          ,)
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
     // margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Write your task here...',
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54, width: 2),
           borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ),
    );
  }

  Widget _raisedButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
         color: Colors.black54,
        textColor: barColor,
        label: Text('ADD'),
        onPressed: () {},
        icon: Icon(Icons.add),
      ),
    );
  }
}
