

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/UI/HomeHabit.dart';

import 'package:to_do/Plan%20B/UI/Page1.dart';

import '../Provider/HabitProvider.dart';
import '../Provider/db_provider.dart';
import 'Pagetask.dart';


class upcoming extends StatefulWidget{
  
  @override
  State<upcoming> createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> with TickerProviderStateMixin{
  DateTime _selecteddate=DateTime.now();

  DatePickerController? controller;

  
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length:2,vsync: this );
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 249, 252),
     // Color.fromRGBO(rgba(241,246,252,255)),
     body: Padding(
       padding: const EdgeInsets.only(top:65.0,left:20,right:20),
       child: Column(
        children: [

          Row(
            children: [
              IconButton(onPressed: (() {
                
              }), icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.grey,)),
             SizedBox(width: 100,),
             Text('Upcoming',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
            
            ],
          ),
          SizedBox(height: 10,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35)
               ),
               child: TabBar(indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color.fromRGBO(34, 177, 237, 100)
               ),
               controller: tabController,
               isScrollable: true,
               labelPadding: EdgeInsets.symmetric(horizontal: 30),
               tabs: [
                Tab(child: Text('Habit',style: TextStyle(color:Colors.grey[600]),),),
               Tab(child: Text('Task',style: TextStyle(color: Colors.grey[600]),),),
               ],
               ),
             ),
          ),
         // SizedBox(height: 6,),
          Container(
            margin: EdgeInsets.only(top:20,left:2),
            child: DatePicker(
              DateTime.now(),
          selectionColor: Color.fromARGB(255, 236, 225, 233),
          selectedTextColor: Colors.white,


              width: 80,
              height: 100,
              controller:controller ,
              
              
              dateTextStyle:GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 78, 77, 77)
                )

              ) ,
              onDateChange:(date){
                _selecteddate=date;
              }

            ),

          ),
          SizedBox(height: 10,),

      //      Center(
      //     child: Text(DateFormat.yMMMMEEEEd().format(DateTime.now())),
      //   ),
      //   DatePicker(
      
      //   DateTime.now(),
      //   initialSelectedDate: DateTime.now(),
      //   selectionColor: Color.fromARGB(255, 239, 157, 216),
      //   selectedTextColor: Colors.white,
      
      // ),

          Expanded(child: TabBarView(
            controller: tabController,
            children: [
             

           
    ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
            itemCount: Provider.of<HabitProvider>(context).selectedHabit.length,
            itemBuilder: (context, index) {
              return HomeHabit (Provider.of<HabitProvider>(context).selectedHabit[index]);
            }),
            Consumer<DbProvider>(
      builder: (context,provider,x) {
        return ListView.builder(
            itemCount: provider.allTasks.length,
            itemBuilder: (context, index) {
              return PageTask(provider.allTasks[index]);
            });
      }
    ),
          ],))

        ],
       ),
     ),
      

    );
  }
}
Widget Habit(){
  return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Text(DateFormat.yMMMMEEEEd().format(DateTime.now())),
        ),
        DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        
        selectionColor: Color.fromARGB(255, 239, 157, 216),
        selectedTextColor: Colors.white,
      
      ),
      ],

    ),
  );
}

void main(List<String> args) {
  runApp(MaterialApp(home:upcoming()));
}
