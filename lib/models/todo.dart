import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDo {
  String? id;
  String? task;
  bool isDone;

  ToDo({
    required this.id,
    required this.task,
    this.isDone = false,
  });

  Future<String> getToDoFromAPI() async {
    try {
      print('ToDo from API');
      String api = 'http://10.20.0.110:2000/api/todo/1';
      http.Response res = await http.get(Uri.parse(api));
      // print(res.body);

      final data = jsonDecode(res.body);
      // ToDo result =
      //     ToDo(id: data['id'], task: data['task'], isDone: data['isDone']);

      return 'result';
    } catch (error) {
      return 'toDo';
      // return ToDo(id: 'default', task: 'task');
    }
  }

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: json["id"],
        task: json["task"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "isDone": isDone,
      };
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', task: 'Morning Excercise', isDone: true),
      ToDo(id: '02', task: 'Buy Groceries', isDone: true),
      ToDo(id: '03', task: 'Check Emails'),
      ToDo(id: '04', task: 'Team Meeting'),
      ToDo(id: '05', task: 'Work on mobile apps for 2 hour'),
      ToDo(id: '06', task: 'Dinner with Jenny'),
    ];
  }
}
