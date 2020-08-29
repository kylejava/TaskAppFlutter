class Task{
  String NameOfTask;
  var number;

  Task({this.NameOfTask , this.number});

  void Print(){
    print('Task: ' + NameOfTask);
    print('Task Number: $number');
  }
}