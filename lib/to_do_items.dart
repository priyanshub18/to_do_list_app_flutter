import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list_app/todo.dart';

class ToDoItems extends StatelessWidget {
  final ToDo todoitem;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;
  const ToDoItems({
    super.key,
    required this.todoitem,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: () {
          onToDoChanged(todoitem);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color.fromARGB(231, 242, 242, 242),
        leading: Icon(
          todoitem.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
          todoitem.todoText as String,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: todoitem.isDone ? TextDecoration.lineThrough : null,
              decorationThickness: 3,
              decorationColor: Colors.black),
        ),
        trailing: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 35, 21),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete ToDo",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                          'Are you sure you want to delete this ToDo from the list?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "No",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              onDeleteItem(todoitem.id);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                      ],
                    );
                  });
              // print("clicked on delete icon");
            },
            icon: const Icon(
              Icons.delete,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
