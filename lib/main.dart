import 'package:flutter/material.dart';
import 'package:to_do_list_app/to_do_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'Lato',
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,

      ),
      title: "To Do App",
      home: const ToDoMainPage(),
    );
  }
}