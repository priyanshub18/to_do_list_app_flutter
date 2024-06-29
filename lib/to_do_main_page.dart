import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list_app/to_do_items.dart';
import 'package:to_do_list_app/todo.dart';

class ToDoMainPage extends StatefulWidget {
  const ToDoMainPage({super.key});

  @override
  State<ToDoMainPage> createState() => _ToDoMainPageState();
}

class _ToDoMainPageState extends State<ToDoMainPage> {
  final todoList = ToDo.todoList();
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
      // backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30,
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {
                    //show a positive quote ki api i'll use
                  },
                  icon: const Icon(Icons.sunny)),
            )
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: const Text(
                      "All ToDOs",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  for (ToDo todo in _foundToDo.reversed)
                    ToDoItems(
                      todoitem: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _handleToDoDelete,
                    ),
                ],
              ))
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 10,
                  left: 20,
                ),
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _todoController,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                      hintText: "Add a new ToDo",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none),
                ),
              )),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                // padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 10 ) ,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      enableFeedback: true,
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () {
                      _addToDo(_todoController.text);
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleToDoDelete(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String todo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo>? result = [];
    if (enteredKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      setState(() {
        _foundToDo = result!;
      });
    }
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child:  TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          focusColor: Colors.white,
          suffixIcon: Icon(
            Icons.arrow_right_outlined,
            size: 40,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
