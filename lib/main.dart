import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'taskmodel.dart';
import 'homepage.dart';


void main() {
  var state = MyState();
  state.getList();

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: ToDoApp()),
  );
}

final barColor = const Color(0xFFcfcfc4);
final bgColor = const Color(0xFFf5f5f5);
final textcolor = const Color(0xFF000000);


class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO LIST',
      home: HomePage(),
    );
  }
}