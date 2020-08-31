import 'package:flutter/material.dart';
import "dart:math";
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
  final _random = new Random();
  final myController = TextEditingController();
  List<Color> _colors = [
    Colors.yellow[200],
    Colors.green[200],
    Colors.white,
    Colors.blue[200],
    Colors.red[200]
  ];
  final _ToDoList = <Task>[];



  Widget _BuildItem (Task t){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        //color: _colors[_random.nextInt(_colors.length)],
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task: #${t.number}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  t.NameOfTask,
                  style: TextStyle(

                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton.icon(
                    onPressed: () {
                      _ToDoList.remove(t);
                      _BuildTasks();
                      print(_ToDoList.length);
                      counter = counter -1;
                    },
                    icon: Icon(
                      Icons.delete,
                    ),
                   label: Text(''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _BuildTasks(){
    return ListView.builder(
        itemCount: _ToDoList.length,
        itemBuilder: (context , index){
          return(_BuildItem(_ToDoList[index]));
        }
    );
  }

  @override
  void dispose() {

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
              onPressed: () {},
              icon: Icon(
                Icons.assignment,
                color: Colors.white,

              ),
            ),
          ],
        ),

        centerTitle: true,
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
                NameOfTask: myController.text, number: counter
            );
            new_task.Print();
            _ToDoList.add(new_task);
            setState(() {
              _BuildTasks();
            });
            //_BuildTasks(_ToDoList);

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

            Expanded(
              child: _BuildTasks(),
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
    );
  }
}

