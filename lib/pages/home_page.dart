import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo> todoList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'All ToDo Tasks',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todo in _foundToDo.reversed)
                    ToDoItem(
                      todo: todo,
                      onToDoChange: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                ],
              ),
            ),
          ]),
        ),
        _addNewItem()
      ]),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addNewToDoItem(String newToDo) {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        task: newToDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = todoList
          .where((item) =>
              item.task!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    } else {
      results = todoList;
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget _addNewItem() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
              left: 20,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintText: 'Add a new task to do',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 20,
            right: 20,
          ),
          child: ElevatedButton(
            onPressed: () {
              _addNewToDoItem(_todoController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorBlue,
              minimumSize: const Size(60, 60),
              elevation: 10,
            ),
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: colorBlack,
            size: 20.0,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20.0,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: colorGrey,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: colorBG,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.menu,
              color: colorBlack,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/images/me.jpeg'),
              ),
            )
          ],
        ),
      ),
      centerTitle: true,
      titleSpacing: 1.0,
    );
  }
}
