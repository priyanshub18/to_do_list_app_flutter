// import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: 'Go to GYM slimAss', isDone: true ),
      ToDo(id: '02', todoText: 'Buy a raand', isDone: true ),
      ToDo(id: '03', todoText: 'Check your homie\'s messages', ),
      ToDo(id: '04', todoText: 'Team Meeting with her 🥰', ),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', ),
      ToDo(id: '06', todoText: 'Leetcode Grind', ),
    ];
  }

 
  
}