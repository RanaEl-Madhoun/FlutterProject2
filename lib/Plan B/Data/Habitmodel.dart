import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DbHelper.dart';

class HabitModel{
  int ?id;

late bool ?isComplete;
String text='';
 String image='';
 Color color=(Colors.white);
HabitModel({
 required this.text,
  required this.image,
  
  this.isComplete,
 required this.color

});
HabitModel.fromMap(Map<String, dynamic> map) {
 color=map[DbHelper.habitcolor];
    id = map[DbHelper.habitIdcolumnname];
    text = map[DbHelper.habittext];
    image=map[DbHelper.habitimage];
    isComplete = map[DbHelper.habitIdcolumnname] == 1 ? true : false;
  }
  Map<String, dynamic> toMap() {
    return {
    DbHelper.habitcolor:color,
      DbHelper.habittext: text,
      DbHelper.habitimage:image,
      DbHelper.taskIsCompleteColumName: (isComplete!) ? 1 : 0
    };
  }

}