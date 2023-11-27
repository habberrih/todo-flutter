class ToDo {
  String? id;
  String? task;
  bool isDone;

  ToDo({
    required this.id,
    required this.task,
    this.isDone = false,
  });

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
