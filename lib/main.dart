import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(ToDoApp());

final barColor = const Color(0xFFe2ae9d);
final bgColor = const Color(0xFFe2ae9d);
final textcolor = const Color(0xFF000000);

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('TO DO LIST'),
    home: HomePage(),
    
    
    );
  }
}

