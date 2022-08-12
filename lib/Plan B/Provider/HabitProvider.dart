import 'package:flutter/material.dart';
import 'package:to_do/Plan%20B/UI/habitWidget.dart';

import '../Data/DbHelper.dart';
import '../Data/Habitmodel.dart';
import '../UI/HomeHabit.dart';

class HabitProvider extends ChangeNotifier{
  HabitProvider();
  List<HomeHabit> habits=[
    //   HomeHabit(concolor: Color.fromARGB(175, 185, 228, 186), image: "assets/images/trees-removebg-preview.png",title:"Get OutSide",Precentcolor:Color.fromARGB(255, 212, 210, 112), Percent: '90%',fill: .9,),
    //  HomeHabit(concolor: Color.fromARGB(174, 234, 182, 208), image: "assets/images/sport2pn-removebg-preview.png", title: "Do some exercies",Precentcolor:Color.fromARGB(255, 146, 59, 136), Percent: '60%',fill:.6),
    //  HomeHabit(concolor: Color.fromARGB(174, 250, 154, 106), image: "assets/images/smokin-removebg-preview.png", title: "Dont Smoke",Precentcolor:Color.fromARGB(255, 212, 210, 112), Percent: '90%',fill: .9,),
    // HomeHabit(concolor: Color.fromRGBO(104, 67, 184, 80), image: "assets/images/drink-removebg-preview.png", title: "Drink 10 cups of water",Precentcolor:Color.fromARGB(255, 212, 210, 112), Percent: '90%',fill: .9,),
    //  HomeHabit(concolor: Color.fromARGB(175, 219, 166, 113), image: "assets/images/bookpgpn-removebg-preview.png", title: "Read 10 pages from book",Precentcolor:Color.fromARGB(255, 146, 59, 136), Percent: '60%',fill:.6),
    
    //  HomeHabit(concolor: Color.fromARGB(174, 165, 212, 195), image: "assets/images/care1-removebg-preview.png", title: "Do Your Skincare",Precentcolor:Color.fromARGB(255, 146, 59, 136), Percent: '60%',fill:.6),
    //  HomeHabit(concolor: Color.fromARGB(175, 152, 138, 231), image: "assets/images/learnlanpn-removebg-preview.png", title: "One hour of learning new language",Precentcolor:Color.fromARGB(255, 212, 210, 112), Percent: '90%',fill: .9,),
    //  HomeHabit(concolor: Color.fromARGB(174, 124, 82, 121), image: "assets/images/cleanpn.png", title: "Cleaning ",Precentcolor:Color.fromARGB(255, 146, 59, 136), Percent: '60%',fill:.6),
  ];

  List<HabitModel>selectedHabit=[];
  fillLists(List<HabitModel> habits) {
    selectedHabit = habits;
    
    notifyListeners();
  }
  addHabitlist(HabitModel habitModel){
    selectedHabit.add(habitModel);
    fillLists(selectedHabit);

  }
  createNewhabit(HabitModel habitModel) async {
    await DbHelper.dbHelper.insertNewhabit(habitModel);
    addHabitlist(habitModel);
  }
  selectAllTasks() async {
    List<HabitModel> tasks = await DbHelper.dbHelper.selectAllThabit();
    fillLists(tasks);
  }

}
