import 'package:http/http.dart' as http;
import 'dart:convert';
import './taskmodel.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'cf4a00f5-2b15-43e3-a1a6-f0f67096da75';

class Api {
  static Future addTodo(Todos todo) async {
    var json = jsonEncode(Todos.toJson(todo));
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
      body: json,
    );
  }

  static Future checkTodo(Todos todo, String todoId) async {
    var json = jsonEncode(Todos.toJson(todo));
    print(json);
    await http.put(
      '$API_URL/todos/$todoId?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
      body: json,
    );
  }

  static Future removeTodo(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future<List<Todos>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Todos>((data) {
      return Todos.fromJson(data);
    }).toList();
  }
}