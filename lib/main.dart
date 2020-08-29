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
  final myController = TextEditingController();
  final _ToDoList = <Task>[];

  Widget _BuildItem (Task t){
    return ListTile(
      title: Text(
        t.NameOfTask,
      ),
    );
  }

  Widget _BuildTasks(_ToDoList){

  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Text(
                'Enter New Item' ,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
            ),
            TextField(

              controller: myController,
              cursorColor: Colors.black,
              decoration: InputDecoration(

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),

              ),
            ),


           /*ListView.builder(
               itemCount: _ToDoList.length,
               itemBuilder: (context, index){
                 return ListTile(
                   title: Text('${_ToDoList[index]}'),
                 );
               },
           ),*/

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(myController.text == ""){
            return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content: Text('Please add new item'),
                );
              },
            );
          }
          else {
            counter += 1;
            Task new_task = Task(
                NameOfTask: myController.text, number: counter);
            new_task.Print();
            _ToDoList.add(new_task);
            print(_ToDoList.length);

            myController.clear();
          }
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

