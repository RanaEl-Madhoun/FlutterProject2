import 'package:to_do/Plan%20B/Data/DbHelper.dart';


class TaskModel {
  int? id;
  String title="Hello";
  String description="";
  late bool isComplete;
  TaskModel({
  required   this.title,
    this.isComplete = false,
   required this.description
  });
  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.taskIdColumName];
    title = map[DbHelper.taskNameColumName];
    description=map[DbHelper.taskdescColumName];
    isComplete = map[DbHelper.taskIsCompleteColumName] == 1 ? true : false;
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.taskNameColumName: title,
      DbHelper.taskdescColumName:description,
      
      DbHelper.taskIsCompleteColumName: (isComplete) ? 1 : 0
    };
  }
}