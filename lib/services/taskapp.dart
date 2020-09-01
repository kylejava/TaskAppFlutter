import 'package:flutter/material.dart';
import 'package:newapp/services/task.dart';

//This Dart file contains the code that can create, delete, and display different tasks.

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {

  var counter = 0; //Counter to hold how many tasks there are
  final _ToDoList = <Task>[]; //List to hold each task
  final myController = TextEditingController(); //Controller used for inputting a new task
  /*List<Color> _colors = [
    //Different colors for different cards
    Colors.yellow[200],
    Colors.green[200],
    Colors.white,
    Colors.blue[200],
    Colors.red[200]
  ];*/





  Widget _BuildItem (Task t){
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
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
                    letterSpacing:1.5,
                  ),
                ),

                Text(
                  t.NameOfTask,
                  style: TextStyle(

                    fontSize: 20.0,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    counter = _ToDoList.length;
                    _ToDoList.remove(t);
                    if(_ToDoList.length == 0){
                      counter = 0;
                    }
                    setState(() {
                      _BuildTasks();
                    });

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

            _ToDoList.add(new_task);
            setState(() {
              _BuildTasks();
            });


            myController.clear();
          }

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
            /*RaisedButton.icon(
                onPressed: () {
                  _ToDoList.clear();
                  counter  = 0;
                  setState(() {
                    _BuildTasks();
                  });
                },
                icon: Icon(
                  Icons.delete,
                ),
                label: Text('Delete All')
            )*/


          ],
        ),
      ),
    );
  }
}

