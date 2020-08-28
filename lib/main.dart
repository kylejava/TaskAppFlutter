import 'package:flutter/material.dart';

import 'package:newapp/services/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TaskApp(),
    );
  }
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {

  var counter = 0;
  final myController = TextEditingController(
  );


  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Task List"),
            IconButton(
              icon: Icon(
                Icons.assignment,
                color: Colors.white,

              ),
            ),
          ],
        ),

        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: TextField(
          controller: myController,
          cursorColor: Colors.black,
          decoration: InputDecoration(

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter += 1;
          Task task1 = Task(NameOfTask:myController.text , number:counter);
          task1.Print();
          myController.clear();
          /*return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );*/
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add_circle),
      ),
    );
  }
}

