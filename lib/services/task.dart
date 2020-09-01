

class Task{
  String NameOfTask;
  var number; //Number of task on the list

  Task({this.NameOfTask , this.number});

  void Print(){
    print('Task: ' + NameOfTask);
    print('Task Number: $number');
  }
}